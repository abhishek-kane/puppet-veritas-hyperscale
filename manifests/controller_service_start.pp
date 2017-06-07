# == Class: controller_service_start
#
# === Variables
#
# === Example
#
#   class {'veritas_hyperscale::controller_service_start':
#   }
#
# === Authors
#
# Chanchal Yevale <chanchal.yevale@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#

class veritas_hyperscale::controller_service_start (
)inherits veritas_hyperscale
{
    require veritas_hyperscale::controller_pkg_inst
    require veritas_hyperscale::hs_volume_type

	service { 'hyperscale-mq-controller':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-mq-consumer':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-zookeeper':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-serengeti':
		ensure => running,
		enable => true,
		}

	service { 'hyperscale-api':
		ensure => running,
		enable => true,
		}
}
