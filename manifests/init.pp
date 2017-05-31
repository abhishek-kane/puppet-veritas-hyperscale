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
#class {'veritas-hyperscale':
#    os_user => "admin",
#    os_passwd => "root123",
#    os_auth_url => "http://controller:35357/v3",
#    os_identity_api_ver => "3",
#    os_project_name => "admin",
#    os_project_domain_name => "default",
#    os_user_domain_name => "default",
#}
#
# === Authors
#
# Abhishek Kane <abhishek.kane@veritas.com>
#
# === Copyright
#
# Copyright 2017 Abhishek Kane, unless otherwise noted.
#
class  veritas-hyperscale (
    $os_user = $os_user,
    $os_passwd = $os_passwd,
    $os_auth_url = $os_auth_url,
    $os_identity_api_ver = $os_identity_api_ver,
    $os_project_name = $os_project_name,
    $os_project_domain_name = $os_project_domain_name,
    $os_user_domain_name = $os_user_domain_name,
)
{ }
