# == Class: hyperscale
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
)
{
  # Bin file
  file {"$path":
    ensure  => 'directory',
    source  => "puppet:///modules/veritas_hyperscale",
    path    => "/tmp/veritas_hyperscale",
    recurse => 'remote',
    owner   => 'heat-admin',
    group   => 'heat-admin',
    mode    => '744',
  }
}
