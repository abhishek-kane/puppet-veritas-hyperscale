# == Class: hs_keystone
#
# === Variables
#
# [keystone_ip]
#   Management IP of keystone node.
#
# === Example
#
#    class {'veritas_hyperscale::hs_keystone':
#        keystone_ip => "172.101.101.1"
#    }
#
# === Authors
#
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#
class  veritas_hyperscale::hs_keystone (
    $keystone_ip = $keystone_ip,
) inherits veritas_hyperscale
{
    require veritas_hyperscale
    require veritas_hyperscale::controller_pkg_inst

    keystone_user { 'hyperscale':
        ensure      => present,
        enabled     => true,
        email       => 'hyperscale@localhost',
        password	=> 'elacsrepyh',
    }

    keystone_user_role { 'hyperscale@service':
        roles   => ['admin'],
        ensure  => present,
    }

    keystone_user { '_proxy_':
        ensure      => present,
        enabled     => true,
        password    => 'elacsrepyh',
    }

    keystone_user_role { '_proxy_@admin':
        roles   => ['admin'],
        ensure  => present,
    }

    keystone_role { 'infra_admin':
      ensure => present,
    }

    keystone_user_role { 'admin@admin':
        roles   => ['admin', 'infra_admin'],
        ensure  => present,
    }

    keystone_service { 'hyperscale':
        name        => 'hyperscale',
        ensure      => present,
        description	=> 'HyperScale Infrastructure Service',
        type    	=> 'infrastructure',
    }

    keystone_endpoint { 'hyperscale':
        ensure          => present,
        type            => 'infrastructure',
        region	    	=> 'RegionOne',
        public_url      => "http://$keystone_ip:8753/v1/%(tenant_id)s",
        admin_url       => "http://$keystone_ip:8753/v1/%(tenant_id)s",
        internal_url    => "http://$keystone_ip:8753/v1/%(tenant_id)s",
    }
}
