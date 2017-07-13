# == Class: hs_rabbitmq
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
class  veritas_hyperscale::hs_rabbitmq (
) inherits veritas_hyperscale
{
  require veritas_hyperscale

  ::openstacklib::messaging::rabbitmq {'vrts_hyperscale':
    userid   => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
  }

  # FIXME The rabbitmq_exchange also uses rabiitmqadmin
  # script just like hs_rabbitmq.sh
  rabbitmq_exchange { 'hyperscale-controller@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-stats@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-datanode@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-recv@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-storage@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-compute-hy@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }

  rabbitmq_exchange { 'hyperscale-datanode-hypervisor@/':
    user     => 'hyperscale',
    password => hiera('vrts_rabbitmq_password', 'elacsrepyh'),
    type     => 'direct',
    durable  => true,
  }
}
