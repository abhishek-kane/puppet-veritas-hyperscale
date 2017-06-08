# == Class: hs_rabbitmq
#
# === Example
#
#    class {'veritas_hyperscale::hs_rabbitmq':
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
class  veritas_hyperscale::hs_rabbitmq (
) inherits veritas_hyperscale
{
    require veritas_hyperscale
    require veritas_hyperscale::hs_keystone

    ::openstacklib::messaging::rabbitmq {'vrts_hyperscale':
       userid       => 'hyperscale',
       password     => 'elacsrepyh',
    }
    # Execute only once.
    exec {'hs_rabbitmq':
        path        => '/usr/bin:/usr/sbin:/bin',
        creates     => "/var/opt/VRTSofcore/.vrts_rabbitmq_configured",
        environment => 'HOME=/root',
        command     => "/$path/scripts/hs_rabbitmq.sh",
    }
}
