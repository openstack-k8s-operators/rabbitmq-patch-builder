# rabbitmq-patch-builder

Contains patches and build automation for openstack-k8s-operators to integrate [rabbitmq/cluster-operator] (https://github.com/rabbitmq/cluster-operator).

## Description

Patch files added to the *patches* directory will be applied during an hourly build of the latest rabbitmq/cluster-operator main code branch. Builds are then pushed to quay.io/openstack-k8s-operators.

## How to create patches

You can create patches by adding to the [openstack-k8s-operators/rabbitmq-cluster-operator] (https://github.com/openstack-k8s-operators/rabbitmq-cluster-operator) *patches* branch and then running 'git format-patch main'. Then copy the resulting patch files into the patch directory in this project. NOTE: This branch is just to maintain patches and is periodically rebased on upstream 'main' to resolve any conflicts.
