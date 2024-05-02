variable "service_name" {
  description = "name of the service, to be used for infra structure resource naming"
  validation {
    condition     = can(regex("^[-_\\da-z]+$", var.service_name))
    error_message = "use only lower case letters, numbers, dashes, and underscores"
  }
}

variable "image_tag" {
  type        = string
  description = "The tag of the image to deploy"
}

variable "image_repository_name" {
  type        = string
  description = "The name of the container image repository"
}

variable "desired_instance_count" {
  type        = number
  description = "Number of instances of the task definition to place and keep running."
  default     = 1
}

variable "cpu" {
  type        = number
  default     = 256
  description = "Number of cpu units used by the task, expessed as an integer value, e.g 512 "
}

variable "memory" {
  type        = number
  default     = 512
  description = "Amount (in MiB) of memory used by the task. e.g. 2048"
}


variable "container_port" {
  type        = number
  description = "The port number on the container that's bound to the user-specified"
  default     = 3000
}

variable "hostname" {
  type        = string
  description = "The hostname to override the default AWS configuration"
  default     = null
}

variable "vpc_id" {
  type        = string
  description = "Uniquely identifies the VPC."
}

variable "public_subnet_ids" {
  type        = list(any)
  description = "Public subnet ids in VPC"
}

variable "private_subnet_ids" {
  type        = list(any)
  description = "Private subnet ids in VPC"
}

variable "extra_environment_variables" {
  type        = map(string)
  description = "Additional environment variables to pass to the service container. Map from environment variable name to the value."
  default     = {}
}

variable "secrets" {
  type = set(object({
    name           = string
    ssm_param_name = string
  }))
  description = "List of configurations for defining environment variables that pull from SSM parameter store"
  default     = []
}

variable "db_vars" {
  description = "Variables for integrating the app service with a database"
  type = object({
    security_group_ids = list(string)
  })
  default = null
}

variable "enable_autoscaling" {
  description = "Flag to enable or disable auto-scaling"
  type        = bool
  default     = false
}

variable "max_capacity" {
  description = "Maximum number of tasks for autoscaling"
  type        = number
  default     = 4
}

variable "min_capacity" {
  description = "Minimum number of tasks for autoscaling"
  type        = number
  default     = 2
}
