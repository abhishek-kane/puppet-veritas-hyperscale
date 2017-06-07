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

    # Execute only once.
    exec {'hs_keystone':
        path   => '/usr/bin:/usr/sbin:/bin',
        creates => "/var/opt/VRTSofcore/.hs_openstack_configured",
        environment => ["HOME=/root", "OS_AUTH_URL=$os_auth_url", "OS_IDENTITY_API_VERSION=$os_identity_api_ver", "OS_USERNAME=$os_user", "OS_PASSWORD=$os_passwd", "OS_PROJECT_DOMAIN_NAME=$os_project_domain_name", "OS_PROJECT_NAME=$os_project_name", "OS_USER_DOMAIN_NAME=$os_user_domain_name", "platform=$platform"],
        command => "/$path/scripts/hs_keystone.sh $keystone_ip",
    }
}
