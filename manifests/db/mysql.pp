# == Class: veritas_hyperscale::db::mysql
#
# The veritas_hyperscale::db::mysql class creates a MySQL database for
# Veritas HyperScale. It must be used on the MySQL server
#
# === Parameters
#
# [*password*]
#   password to connect to the database. Mandatory.
#
# [*dbname*]
#   "HyperScale"
#
# [*user*]
#   "hyperscale"
#
# [*host*]
#   the default source host user is allowed to connect from.
#   Optional. Defaults to 'localhost'
#
# [*allowed_hosts*]
#   other hosts the user is allowd to connect from.
#   Optional. Defaults to undef.
#
# [*charset*]
#   the database charset. Optional. Defaults to 'utf8'
#
# [*collate*]
#   the database collation. Optional. Defaults to 'utf8_general_ci'
#
class veritas_hyperscale::db::mysql (
  $password      = 'elacsrepyh',
  $dbname        = 'HyperScale',
  $user          = 'hyperscale',
  $host          = '127.0.0.1',
  $allowed_hosts = undef,
  $charset       = 'utf8',
  $collate       = 'utf8_general_ci',
) {

  include ::openstacklib::defaults

  ::openstacklib::db::mysql { 'HyperScale':
    user          => $user,
    password_hash => mysql_password($password),
    dbname        => $dbname,
    host          => $host,
    charset       => $charset,
    collate       => $collate,
    allowed_hosts => $allowed_hosts,
  }

  $mysql_cmd = "/usr/bin/mysql --user=${user} --password=${password} --host=${host} < "

  # FIXME the following execs

  exec {'sql1':
    before  => Exec['sql2'],
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => "/tmp/.hs_openstack_configured",
    command => "${mysql_cmd} /tmp/veritas_hyperscale/scripts/db/01_HyperScale.sql",
    #environment => [],
  }

  exec {'sql2':
    before  => Exec['sql3'],
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => "/tmp/.hs_openstack_configured",
    command => "${mysql_cmd} /tmp/veritas_hyperscale/scripts/db/02_HyperScaleStatsSchema.sql",
    #environment => [],
  }

  exec {'sql3':
    before  => Exec['sql4'],
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => "/tmp/.hs_openstack_configured",
    command => "${mysql_cmd} /tmp/veritas_hyperscale/scripts/db/03_HyperScaleWorkflow.sql",
    #environment => [],
  }

  exec {'sql4':
    path    => '/usr/bin:/usr/sbin:/bin',
    creates => "/tmp/.hs_openstack_configured",
    command => "${mysql_cmd} /tmp/veritas_hyperscale/scripts/db/51_HyperScaleAlertsDescription.sql",
    #environment => [],
  }

}
