# == Class: hyperscale
#
# === Variables
#
# [bin_name]
#   The binary name
#
# [path]
#   The directory on controller where the bin file gets copied.
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
#	class {'veritas-hyperscale::controller':
#		bin_name => "HyperScale_release.ubuntu.bin",
#		path => "/root/veritas-hyperscale",
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
# Copyright 2017 Abhishek Kane, unless otherwise noted.
#
class  veritas-hyperscale::controller (
	$bin_name = $bin_name,
	$path = $path,
	$operation = $operation,
	$management_ip = $management_ip,
	$mysql_root_passwd = $mysql_root_passwd,
) inherits veritas-hyperscale
{
	# Bin file
	file {"$path":
		ensure => 'directory',
		before => File['bin'],
		owner => 'root',
		group => 'root',
		mode => '744',
	}

	file {'bin':
		ensure => 'file',
		before => File['installer'],
		source => "puppet:///modules/veritas-hyperscale/$bin_name",
		path => "/$path/$bin_name",
		owner => 'root',
		group => 'root',
		mode => '744',
	}

	if $operation == "install" {
		# The input to bin
		file {'installer':
			ensure => 'file',
			source => 'puppet:///modules/veritas-hyperscale/install_bin.sh',
			path => "/$path/install_bin.sh",
			owner => 'root',
			group => 'root',
			mode => '744',
			notify => Exec['run_hyperscale_installer'],
		}

		# Execute only once.
		exec {'run_hyperscale_installer':
			timeout => '450',
			creates => '/var/opt/VRTSofcore/ofdb',
			environment => 'HOME=/root',
			command => "/$path/install_bin.sh /$path/$bin_name $management_ip $os_passwd $mysql_root_passwd",
		}
	}
}
