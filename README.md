# rabbitmq-patch-builder

Contains patches for openstack-k8s-operators to integrate [rabbitmq/cluster-operator] (https://github.com/rabbitmq/cluster-operator). Also build automation for openstack-k8s-operators.

## Description

Patches added to this directory will be applied to an hourly build to latest upstream rabbitmq/cluster-operator on an hourly basis. Builds are then pushed to quay.io.
