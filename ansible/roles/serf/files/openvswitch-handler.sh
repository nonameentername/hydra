#!/bin/bash

while read line; do
    IP=$(echo "${line}" | awk '{print $2}')
    ROLE=$(echo "${line}" | awk '{print $3}')
    SELF_ROLE=$(serf info | awk '/role =/{print $3}')
    NAME=$(printf '%02X' ${IP//./ }; echo)
    OVSWITCH_BRIDGE=br_$NAME
    OVSWITCH_TUNEL=gre_$NAME
    BRIDGE_NAME=docker0

    if [[ "$SERF_EVENT" == "member-join" && "$SELF_ROLE" != "$ROLE" ]]; then
        ovs-vsctl del-br $OVSWITCH_BRIDGE
        ovs-vsctl add-br $OVSWITCH_BRIDGE
        ovs-vsctl add-port $OVSWITCH_BRIDGE $OVSWITCH_TUNEL -- set interface $OVSWITCH_TUNEL type=gre options:remote_ip=$IP
        brctl addif $BRIDGE_NAME $OVSWITCH_BRIDGE
    fi

    if [[ "$SERF_EVENT" == "member-leave" && "$SELF_ROLE" != "$ROLE" ]]; then
        ovs-vsctl del-br $OVSWITCH_BRIDGE
    fi
done
