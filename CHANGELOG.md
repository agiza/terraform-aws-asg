## Unreleased

#### Consider Implementing:
* Added support for Autoscaling "StepScaling" policy.
* Expose `metrics_granularity`?
* Auto-scaling schedule examples/modules.
* Consider coding `ebs_optimized` against list of [ebs-optimized instances](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html).
* Expose ephemeral block device support

## 0.3.0

#### BACKWARDS INCOMPATIBILITIES / NOTES:
* The following parameters were renamed:
 * `ebse_device_name` to `ebs_vol_device_name`
 * `ebs_snapshot_id` to `ebs_vol_snapshot_id`

#### IMPROVEMENTS:
* Conditional support for the following parameters:
 * `instance_profile`
 * `key_name`
 * `user_data`
* Support for `io1` root & EBS volumes

## 0.2.0 (May 16, 2016)

#### BACKWARDS INCOMPATIBILITIES / NOTES:
* Resources names updated in several places for standardization. Will cause extra churn in existing environments.

#### IMPROVEMENTS:
* Introduced deterministic conditional logic for the following scenarios:
 * Specification of an EBS snapshot to associate with the launch configuration.
 * Specification of ELB(s) to associate with the auto scaling group.
 * Specification of percentage based simple auto scaling policies.
* All variables explicitly typed per HashiCorp best practices.
* Added name prefixing to security group and launch configuration resources.
* Exposed `associate_public_ip_address` parameter on launch configuration.
* Exposed `placement_tenancy` parameter on launch configuration.
* Exposed root volume configuration parameters on launch configuration.
* Exposed EBS volume configuration parameters on launch configuration.
* Exposed `wait_for_capacity_timeout` parameter on auto scaling group.

## 0.1.2 (Apr 27, 2016)

#### BACKWARDS INCOMPATIBILITIES / NOTES:
* Changed the default value for `ebs_optimized` from `true` -> `false`. This setting is more compatible with the majority of instance types.

#### IMPROVEMENTS:
* Name for `aws_launch_configuration`.
* Fixed name label for `aws_autoscaling_group`.
* Fixed name label for auto-scaling group's security group.

## 0.1.1 (Dec 1, 2015)

#### IMPROVEMENTS:
* Updated template_file usage for 0.6.7 to remove deprecation warnings [GH-9]
* Added ASG name to module outputs [GH-8]
* Added default Name tag to auto scaling groups [GH-6]

#### BUG FIXES:
* Updated lifecycle hooks to prevent dependency cycles during destroy [GH-5]
* Added proper lifecycle management to allow launch configuration updates [GH-2]
* Removed `sg-` from ASG security group name [GH-1]

## 0.1.0 (Oct 26, 2015)

* Initial Release
