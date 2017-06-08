# == Class: hyperscale
#
# === Variables
#
# [bin_name]
#   The binary name
#
# [operation]
#   install/uninstall
#
# [management_ip]
#   OpenStack Controller's Management IP
#
# [mysql_root_passwd]
#   MySQL Root Password
#
#
# === Example
#
#	class {'veritas_hyperscale::controller':
#		bin_name => "HyperScale_release.ubuntu.bin",
#		operation => "install",
#		management_ip => "172.101.101.1",
#		mysql_root_passwd => "mysqlpasswd",
#	}
#
# === Authors
#
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#
class  veritas_hyperscale::controller (
	$bin_name = $bin_name,
	$operation = $operation,
	$management_ip = $management_ip,
	$mysql_root_passwd = $mysql_root_passwd,
) inherits veritas_hyperscale
{
	file {'bin':
		ensure => 'file',
		before => File['installer'],
		source => "puppet:///modules/veritas_hyperscale/$bin_name",
		path   => "/$path/$bin_name",
		owner  => 'root',
		group  => 'root',
		mode   => '744',
	}

	if $operation == "install" {
		# The input to bin
		file {'installer':
			ensure      => 'file',
			source      => 'puppet:///modules/veritas_hyperscale/install_bin.sh',
			path        => "/$path/install_bin.sh",
			owner       => 'root',
			group       => 'root',
			mode        => '744',
			notify      => Exec['run_hyperscale_installer'],
		}

		# Execute only once.
		exec {'run_hyperscale_installer':
			timeout     => '450',
			creates     => '/var/opt/VRTSofcore/ofdb',
			environment => 'HOME=/root',
			command     => "/$path/install_bin.sh /$path/$bin_name $management_ip $os_passwd $mysql_root_passwd",
		}
	}
}
