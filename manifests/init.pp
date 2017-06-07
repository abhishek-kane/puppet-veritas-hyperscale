# == Class: hyperscale
#
# === Variables
#
# The class requires following OpenStack environment variables:

#  [OS_AUTH_URL]
#
#  [OS_IDENTITY_API_VERSION]
#
#  [OS_PASSWORD]
#
#  [OS_PROJECT_DOMAIN_NAME]
#
#  [OS_PROJECT_NAME]
#
#  [OS_USER_DOMAIN_NAME]
#
#  [OS_USERNAME]
#
# === Example
#
#class {'veritas_hyperscale':
#    os_user => "admin",
#    os_passwd => "root123",
#    os_auth_url => "http://controller:35357/v3",
#    os_identity_api_ver => "3",
#    os_project_name => "admin",
#    os_project_domain_name => "default",
#    os_user_domain_name => "default",
#    path => "/root/veritas_hyperscale",
#}
#
# === Authors
#
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright (c) 2017 Veritas Technologies LLC.
#
class  veritas_hyperscale (
    $os_user = $os_user,
    $os_passwd = $os_passwd,
    $os_auth_url = $os_auth_url,
    $os_identity_api_ver = $os_identity_api_ver,
    $os_project_name = $os_project_name,
    $os_project_domain_name = $os_project_domain_name,
    $os_user_domain_name = $os_user_domain_name,
    $path = $path,
    $platform = $::osfamily,
)
{
    # Bin file
    file {"$path":
        ensure => 'directory',
        source => "puppet:///modules/veritas_hyperscale",
        path => "$path",
        recurse => 'remote',
        owner => 'root',
        group => 'root',
        mode => '744',
    }
}
