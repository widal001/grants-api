output "database_config" {
  value = var.has_database ? {
    region                      = var.default_region
    cluster_name                = "${var.app_name}-${var.environment}"
    access_policy_name          = "${var.app_name}-${var.environment}-db-access"
    app_username                = "app"
    migrator_username           = "migrator"
    schema_name                 = var.app_name
    app_access_policy_name      = "${var.app_name}-${var.environment}-app-access"
    migrator_access_policy_name = "${var.app_name}-${var.environment}-migrator-access"
    instance_count              = var.database_instance_count
    enable_http_endpoint        = var.database_enable_http_endpoint
    max_capacity                = var.database_max_capacity
    min_capacity                = var.database_min_capacity
  } : null
}

output "service_config" {
  value = {
    region = var.default_region
    extra_environment_variables = merge(
      local.default_extra_environment_variables,
      var.service_override_extra_environment_variables
    )

    secrets = toset(local.secrets)
  }
}

output "incident_management_service_integration" {
  value = var.has_incident_management_service ? {
    integration_url_param_name = "/monitoring/${var.app_name}/${var.environment}/incident-management-integration-url"
  } : null
}

output "domain" {
  value = var.domain
}
