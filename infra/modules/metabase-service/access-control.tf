#----------------
# Access Control
#----------------

resource "aws_iam_role" "task_executor" {
  name               = local.task_executor_role_name
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_assume_role_policy.json
}

resource "aws_iam_role" "app_service" {
  name               = "${var.service_name}-app"
  assume_role_policy = data.aws_iam_policy_document.ecs_tasks_assume_role_policy.json
}

data "aws_iam_policy_document" "ecs_tasks_assume_role_policy" {
  statement {
    sid = "ECSTasksAssumeRole"
    actions = [
      "sts:AssumeRole"
    ]
    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com", "states.amazonaws.com", "scheduler.amazonaws.com"]
    }
  }
}

data "aws_iam_policy_document" "task_executor" {
  # checkov:skip=CKV_AWS_111:Ignore some IAM policy checks for the task executor role

  # Allow ECS to log to Cloudwatch.
  statement {
    actions = [
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams"
    ]
    resources = [
      "${aws_cloudwatch_log_group.service_logs.arn}:*",
    ]
  }

  # via https://docs.aws.amazon.com/step-functions/latest/dg/cw-logs.html
  statement {
    sid = "UnscopeLogsPermissions"
    actions = [
      "logs:CreateLogDelivery",
      "logs:CreateLogStream",
      "logs:GetLogDelivery",
      "logs:UpdateLogDelivery",
      "logs:DeleteLogDelivery",
      "logs:ListLogDeliveries",
      "logs:PutLogEvents",
      "logs:PutResourcePolicy",
      "logs:DescribeResourcePolicies",
      "logs:DescribeLogGroups",
    ]
    resources = ["*"]
  }

  # via https://docs.aws.amazon.com/step-functions/latest/dg/xray-iam.html
  statement {
    sid = "StepFunctionsXRay"
    actions = [
      "xray:PutTraceSegments",
      "xray:PutTelemetryRecords",
      "xray:GetSamplingRules",
      "xray:GetSamplingTargets"
    ]
    resources = ["*"]
  }

  statement {
    sid = "StepFunctionsRunTask"
    actions = [
      "ecs:RunTask",
      "ecs:StopTask",
      "ecs:DescribeTasks",
    ]
    resources = ["*"]
  }

  statement {
    sid = "StepFunctionsPassRole"
    actions = [
      "iam:PassRole",
    ]
    resources = [
      aws_iam_role.app_service.arn,
      aws_iam_role.task_executor.arn,
    ]
  }

  statement {
    sid = "StepFunctionsEvents"
    actions = [
      "events:PutTargets",
      "events:PutRule",
      "events:DescribeRule",
    ]
    resources = ["*"]
  }

  statement {
    sid = "StepFunctionsStartExecution"
    actions = [
      "states:StartExecution",
    ]
    resources = ["arn:aws:states:*:*:stateMachine:*"]
  }

  dynamic "statement" {
    for_each = length(var.secrets) > 0 ? [1] : []
    content {
      sid       = "SecretsAccess"
      actions   = ["ssm:GetParameters"]
      resources = local.secret_arn_patterns
    }
  }
}

resource "aws_iam_role_policy" "task_executor" {
  name   = "${var.service_name}-task-executor-role-policy"
  role   = aws_iam_role.task_executor.id
  policy = data.aws_iam_policy_document.task_executor.json
}
