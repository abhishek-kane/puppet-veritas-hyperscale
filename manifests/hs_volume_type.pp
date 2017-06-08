# == Class: hs_volume_type
#
# === Example
#
#    class {'veritas_hyperscale::hs_volume_type':
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
class  veritas_hyperscale::hs_volume_type (
) inherits veritas_hyperscale
{
    require veritas_hyperscale
    require veritas_hyperscale::hs_flavors

    # Execute only once.
    exec {'hs_volume_type':
        path        => '/usr/bin:/usr/sbin:/bin',
        creates     => "/var/opt/VRTSofcore/.hs_volume_type_created",
        environment => ["HOME=/root", "OS_AUTH_URL=$os_auth_url", "OS_IDENTITY_API_VERSION=$os_identity_api_ver", "OS_USERNAME=$os_user", "OS_PASSWORD=$os_passwd", "OS_PROJECT_DOMAIN_NAME=$os_project_domain_name", "OS_PROJECT_NAME=$os_project_name", "OS_USER_DOMAIN_NAME=$os_user_domain_name"],
        command     => "/$path/scripts/hs_volume_type.sh",
    }
}
