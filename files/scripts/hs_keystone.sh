#!/bin/bash
#
# === Authors
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
#
# === Copyright
# Copyright (c) 2017 Veritas Technologies LLC.

IDEMPOTENT="/var/opt/VRTSofcore/.hs_openstack_configured"
if [ -f $IDEMPOTENT ]
then
    exit 0
fi
touch $IDEMPOTENT

# TODO : command exit status and error logging.

IS_UBUNTU=`uname -a |grep -c Ubuntu`
if [ "X"$platform == "Xredhat" ]
then
    proj="services"
else
    proj="service"
fi

MGMT_ID=$1
CMD_OPNSTK="/usr/bin/openstack "
URL_V1="\"http://$MGMT_ID:8753/v1/%(tenant_id)s\""

# Remove/Cleanup stale configuration
$CMD_OPNSTK role remove --user admin --project admin infra_admin
$CMD_OPNSTK role delete infra_admin
$CMD_OPNSTK role remove --user _proxy_ --project admin admin
$CMD_OPNSTK user delete _proxy_
$CMD_OPNSTK user delete _backup_user_
$CMD_OPNSTK service delete hyperscale
$CMD_OPNSTK role remove --user hyperscale --project $proj admin
$CMD_OPNSTK user delete hyperscale

# Add hyperscale configuration in openstack.
$CMD_OPNSTK user create --password $OS_PASSWORD --email hyperscale@localhost hyperscale
# TODO: Need to check if project 'services', 'admin' exists or not.
$CMD_OPNSTK role add --user hyperscale --project $proj admin
$CMD_OPNSTK service create --name hyperscale --description "HyperScale Infrastructure Service" infrastructure
$CMD_OPNSTK endpoint create --region RegionOne infrastructure public $URL_V1
$CMD_OPNSTK endpoint create --region RegionOne infrastructure internal $URL_V1
$CMD_OPNSTK endpoint create --region RegionOne infrastructure admin $URL_V1
$CMD_OPNSTK user create --password $OS_PASSWORD _proxy_
$CMD_OPNSTK role add --user _proxy_ --project admin admin
$CMD_OPNSTK role create infra_admin
$CMD_OPNSTK role add --user admin --project admin infra_admin
