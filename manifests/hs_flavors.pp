# == Class: hs_flavors
#
# === Example
#
#    class {'veritas_hyperscale::hs_flavors':
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
class  veritas_hyperscale::hs_flavors (
) inherits veritas_hyperscale
{
    require veritas_hyperscale
    require veritas_hyperscale::hs_rabbitmq

    include ::openstack_integration::config

	nova_flavor { 'VRTSGold':
		ensure => present,
		ram    => '8192',
		disk   => '80',
		vcpus  => '4',
	}

	nova_flavor { 'VRTSSilver':
		ensure => present,
		ram    => '4096',
		disk   => '40',
		vcpus  => '2',
	}

	nova_flavor { 'VRTSBronze':
		ensure => present,
		ram    => '2048',
		disk   => '20',
		vcpus  => '1',
	}

	# Execute only once.
	exec {'hs_flavors':
		path        => '/usr/bin:/usr/sbin:/bin',
		creates     => "/var/opt/VRTSofcore/.hs_flavor_configured",
		environment => ["HOME=/root", "OS_AUTH_URL=$os_auth_url", "OS_IDENTITY_API_VERSION=$os_identity_api_ver", "OS_USERNAME=$os_user", "OS_PASSWORD=$os_passwd", "OS_PROJECT_DOMAIN_NAME=$os_project_domain_name", "OS_PROJECT_NAME=$os_project_name", "OS_USER_DOMAIN_NAME=$os_user_domain_name"],
		command     => "/$path/scripts/hs_flavors.sh",
	}
}
