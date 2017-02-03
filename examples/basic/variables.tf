# Input Variables

## Resource tags
variable "stack_item_fullname" {
  type = "string"
}

variable "stack_item_label" {
  type = "string"
}

## VPC parameters
variable "lan_subnet_ids" {
  type = "string"
}

variable "region" {
  type = "string"
}

variable "vpc_id" {
  type = "string"
}

## LC parameters
variable "ami" {
  type = "string"
}

variable "instance_type" {
  type = "string"
}

## ASG parameters
variable "cluster_max_size" {
  type = "string"
}

variable "cluster_min_size" {
  type = "string"
}
