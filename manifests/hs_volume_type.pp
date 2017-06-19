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

    # FIXME This is being done via cinder components.
    cinder_type { $name:
        ensure     => present,
        properties => ["volume_backend_name=Veritas_HyperScale}"],
    }
}
