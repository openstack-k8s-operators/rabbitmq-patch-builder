# rabbitmq-patch-builder

Contains patches and build automation for openstack-k8s-operators to integrate [rabbitmq/cluster-operator] (https://github.com/rabbitmq/cluster-operator).

## Description

Patch files added to the *patches* directory will be applied during an hourly build of the latest rabbitmq/cluster-operator main code branch. Builds are then pushed to quay.io/openstack-k8s-operators.

## How to create patches

You can create patches by adding to the [openstack-k8s-operators/rabbitmq-cluster-operator] (https://github.com/openstack-k8s-operators/rabbitmq-cluster-operator) *patches* (currently on the v2.16.1\_patches) branch and then running 'git format-patch main'. Then copy the resulting patch files into the patch directory in this project. NOTE: This branch is just to maintain patches and is periodically rebased a new upstream tag to keep us reasonably current.

## Example for v2.16.1 (or later)
If we rebase on the v2.16.1 tag.... you create a branch to "stage" these patches (currently on the v2.16.1\_patches branch)
the first two commits there have always applied cleanly (OLM and FIPS). This last commit (the struct) will need to
be re-created each time. You copy the base struct, and drop the Image* parameters. Commit that, and then 'format-patches' and
copy those into this repo (deleting any patches that are no longer needed/used). Maintain comments in any old commits.

This last commit on the patches branch (the struct for RabbitmqClusterSpecCore) will need to be re-created each time.
You copy the base struct, and drop the Image* parameters. Commit that, and then 'format-patches'.

In order to get openstack-operator to use a new build you will need to do 2 things:

* Update the go.mod and apis/go.mod in openstack-operator to use the new struct. NOTE: this involves 2 locations
  in each go.mod file one for the upstream, and a 2nd *replace* directive near the bottom of those files to refer
  to the updated patch. Use the new branch name instead of the psuedoversion, run 'make tidy' and it will swap
  the branch name out for the new psuedoversion. Then commit, and create a PR.

* Lastly, bump the bundle/sha for the rabbitmq-cluster-operator in openstack-operator's https://github.com/openstack-k8s-operators/openstack-operator/blob/main/hack/pin-bundle-images.sh (again near the bottom of the script).
