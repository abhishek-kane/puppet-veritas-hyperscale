# == Class: hs_keystone
#
# === Authors
#
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#
class  veritas_hyperscale::hs_keystone (
) inherits veritas_hyperscale
{
  require veritas_hyperscale

  include ::keystone::deps

  $keystone_ip = hiera('keystone_admin_api_vip', false)

  if ($keystone_ip) {
    keystone_user { 'hyperscale':
      ensure   => present,
      enabled  => true,
      email    => 'hyperscale@localhost',
      password => hiera('vrts_keystone_password', 'elacsrepyh'),
    }

    keystone_user_role { 'hyperscale@service':
      ensure => present,
      roles  => ['admin'],
    }

    keystone_user { '_proxy_':
      ensure   => present,
      enabled  => true,
      password => hiera('vrts_keystone_password', 'elacsrepyh'),
    }

    keystone_user_role { '_proxy_@admin':
      ensure => present,
      roles  => ['admin'],
    }

    keystone_role { 'infra_admin':
      ensure => present,
    }

    keystone_user_role { 'admin@admin':
      ensure => present,
      roles  => ['admin', 'infra_admin'],
    }

    keystone_service { 'hyperscale':
      ensure      => present,
      name        => 'hyperscale',
      description => 'HyperScale Infrastructure Service',
      type        => 'infrastructure',
    }

    keystone_endpoint { 'hyperscale':
      ensure       => present,
      type         => 'infrastructure',
      region       => 'RegionOne',
      public_url   => "http://$keystone_ip:8753/v1/%(tenant_id)s",
      admin_url    => "http://$keystone_ip:8753/v1/%(tenant_id)s",
      internal_url => "http://$keystone_ip:8753/v1/%(tenant_id)s",
    }
  }
}
