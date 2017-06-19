#!/bin/bash
#
# === Authors
# Dnyaneshwar Pawar <dnyaneshwar.pawar@veritas.com>
#
# === Copyright
# Copyright (c) 2017 Veritas Technologies LLC.

# FIXME This script is not required now. Delete it.

IDEMPOTENT="/var/opt/VRTSofcore/.vrts_rabbitmq_configured"
if [ -f $IDEMPOTENT ]
then
    exit 0
fi
touch $IDEMPOTENT

# TODO : command exit status.
CMD_RABBITMQA_PLUGIN=/usr/lib/rabbitmq/bin/rabbitmq-plugins
CMD_RABBITMQCTL=/usr/sbin/rabbitmqctl
CMD_RABBITMQADMIN=/opt/VRTSofcore/adm/rabbitmqadmin

# Enable "rabbitmq_management" plugin.
$CMD_RABBITMQA_PLUGIN enable rabbitmq_management

# Add user tags
$CMD_RABBITMQCTL set_user_tags hypescale management

#TODO: check file and add hyperscale spefic configuration to rabbitmq-env.conf.
#ls /etc/rabbitmq/rabbitmq-env.conf

# Delete stale configuration.
$CMD_RABBITMQADMIN delete exchange name=hyperscale-controller -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-stats -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-recv -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-storage -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-datanode -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-compute-hy -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN delete exchange name=hyperscale-datanode-hypervisor -u hyperscale -p elacsrepyh

# Create rabbitmq exchanges for hyperscale.
$CMD_RABBITMQADMIN declare exchange name=hyperscale-controller type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-stats type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-datanode type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-recv type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-storage type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-compute-hy type=direct durable=true -u hyperscale -p elacsrepyh
$CMD_RABBITMQADMIN declare exchange name=hyperscale-datanode-hypervisor type=direct durable=true -u hyperscale -p elacsrepyh

