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

    # FIXME Whether we should do thid via a nova component?
    #include ::openstack_integration::config

    nova_flavor { 'VRTSGold':
        ensure      => present,
        ram         => '8192',
        disk        => '80',
        vcpus       => '4',
        properties  => {ref_factor => '2', qos_priority => '3', dn_ref_factor => '1', qos_maxiops => '30000', qos_miniops => '300'},
    }

    nova_flavor { 'VRTSSilver':
        ensure      => present,
        ram         => '4096',
        disk        => '40',
        vcpus       => '2',
        properties  => {ref_factor => '1', qos_priority => '2', dn_ref_factor => '1', qos_maxiops => '20000', qos_miniops => '200'},
    }

    nova_flavor { 'VRTSBronze':
        ensure      => present,
        ram         => '2048',
        disk        => '20',
        vcpus       => '1',
        properties  => {ref_factor => '0', qos_priority => '1', dn_ref_factor => '0', qos_maxiops => '10000', qos_miniops => '100'},
    }
}
