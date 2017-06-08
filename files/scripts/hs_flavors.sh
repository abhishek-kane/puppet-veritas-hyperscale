#!/bin/bash
#
# === Authors
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
#
# === Copyright
# Copyright (c) 2017 Veritas Technologies LLC.

IDEMPOTENT="/var/opt/VRTSofcore/.hs_flavor_configured"
if [ -f $IDEMPOTENT ]
then
    exit 0
fi
touch $IDEMPOTENT

# TODO : command exit status and error logging.

CMD_OPNSTK="/usr/bin/openstack "

# Create VRTS flavors.
$CMD_OPNSTK flavor set --property ref_factor=2 --property qos_priority=3 --property dn_ref_factor=1 --property qos_maxiops=30000 --property qos_miniops=300 VRTSGold
$CMD_OPNSTK flavor set --property ref_factor=1 --property qos_priority=2 --property dn_ref_factor=1 --property qos_maxiops=20000 --property qos_miniops=200 VRTSSilver
$CMD_OPNSTK flavor set --property ref_factor=0 --property qos_priority=1 --property dn_ref_factor=0 --property qos_maxiops=10000 --property qos_miniops=100 VRTSBronze
