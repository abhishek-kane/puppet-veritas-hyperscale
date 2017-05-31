# == Class: hyperscale
#
# === Variables
#
# [operation]
#   compute-enable
#
# [cn_management_ip]
#   Compute node's management IP
#
# [data_disks]
#   List of data disks
#
# [meta_disk]
#   Metadata disk
#
# [cn_root_passwd]
#   Root paswd of compute node
#
# === Example
#
#    class {'veritas-hyperscale::compute':
#        operation => "compute-enable",
#        cn_management_ip => "172.101.101.3",
#        data_disks => ["/dev/sdb"],
#        meta_disk => "/dev/sdc",
#        cn_root_passwd => "root123",
#    }
#
# === Authors
#
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright 2017 Abhishek Kane, unless otherwise noted.
#
class  veritas-hyperscale::compute (
    $operation = $operation,
    $cn_management_ip = $cn_management_ip,
    $data_disks = $data_disks,
    $data_disk_str = join($data_disks, ","),
    $meta_disk = $meta_disk,
    $cn_root_passwd = $cn_root_passwd,
) inherits veritas-hyperscale
{
	if $operation == "compute-enable" {
		# Execute only once.
		exec {'enable-computenode':
            path   => '/usr/bin:/usr/sbin:/bin',
            onlyif => "test -f /var/opt/VRTSofcore/ofdb",
            unless => "grep -q \"compute_$cn_management_ip\" /var/opt/VRTSofcore/ofdb",
			environment => ["HOME=/root", "OS_AUTH_URL=$os_auth_url", "OS_IDENTITY_API_VERSION=$os_identity_api_ver", "OS_USERNAME=$os_user", "OS_PASSWORD=$os_passwd", "OS_PROJECT_DOMAIN_NAME=$os_project_domain_name", "OS_PROJECT_NAME=$os_project_name", "OS_USER_DOMAIN_NAME=$os_user_domain_name"],
			command => "hyperscale compute-enable $cn_management_ip $cn_root_passwd $os_passwd $meta_disk $data_disk_str",
		}
	}
}
