# == Class: hyperscale
#
# === Variables
#
# [operation]
#   dn-add
#
# [dn_management_ip]
#   Management IP of data node
#
# [data_disks]
#   List of data disks
#
# [meta_disk]
#   Meta disk
#
# [dn_data_interface]
#   The network interface name of data network
#
# [dn_root_passwd]
#   Data node's root password
#
# === Example
#
#    class {'veritas_hyperscale::data':
#        operation => "dn-add",
#        dn_management_ip => "172.101.101.1",
#        data_disks => ["/dev/sdb"],
#        meta_disk => "/dev/sdc",
#        dn_data_interface => "ens224",
#        dn_root_passwd => "rootpasswd",
#    }
#
# === Authors
#
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#
class  veritas_hyperscale::data (
    $operation = $operation,
    $dn_management_ip = $dn_management_ip,
    $data_disks = $data_disks,
    $data_disk_str = join($data_disks, ","),
    $meta_disk = $meta_disk,
    $dn_data_interface = $dn_data_interface,
    $dn_root_passwd = $dn_root_passwd,
) inherits veritas_hyperscale
{
	if $operation == "dn-add" {
		# Execute only once.
		exec {'add-datanode':
            path        => '/usr/bin:/usr/sbin:/bin',
            onlyif      => "test -f /var/opt/VRTSofcore/ofdb",
            unless      => "grep -q \"DATANODE_$dn_management_ip\" /var/opt/VRTSofcore/ofdb",
			environment => ["HOME=/root", "OS_AUTH_URL=$os_auth_url", "OS_IDENTITY_API_VERSION=$os_identity_api_ver", "OS_USERNAME=$os_user", "OS_PASSWORD=$os_passwd", "OS_PROJECT_DOMAIN_NAME=$os_project_domain_name", "OS_PROJECT_NAME=$os_project_name", "OS_USER_DOMAIN_NAME=$os_user_domain_name"],
			command     => "hyperscale dn-add $dn_management_ip $dn_root_passwd $os_passwd $dn_data_interface 0.0.0.0/24 --data_disks $data_disk_str --meta_disk $meta_disk",
		}
	}
}
