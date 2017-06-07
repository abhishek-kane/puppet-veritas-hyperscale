#!/bin/bash
#
# === Authors
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
#
# === Copyright
# Copyright (c) 2017 Veritas Technologies LLC.

IDEMPOTENT="/var/opt/VRTSofcore/.hs_volume_type_created"
if [ -f $IDEMPOTENT ]
then
    exit 0
fi
touch $IDEMPOTENT

# TODO : command exit status and error logging.

CMD_OPNSTK="/usr/bin/openstack "
DISCRIPTION="Volumes utilizing Veritas HyperScale technology. To be used with instances having one of the HyperScale defined flavors."
# Create Veritas_HyperScale volume type.
$CMD_OPNSTK volume type list -fvalue | /bin/grep -c Veritas_HyperScale
$CMD_OPNSTK volume type create --description "$DISCRIPTION" Veritas_HyperScale
$CMD_OPNSTK volume type set --property volume_backend_name=Veritas_HyperScale Veritas_HyperScale
