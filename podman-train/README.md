# Podman

Notes for a novice Docker user migrating to Podman.

[https://docs.podman.io/en/latest/Tutorials.html](https://docs.podman.io/en/latest/Tutorials.html)

## Things to look at later if needed:

[How to access Podman remotely](https://github.com/containers/podman/blob/main/docs/tutorials/remote_client.md). If I need to access containers via SSH or something.

[How to sign and distribute container images](https://github.com/containers/podman/blob/main/docs/tutorials/image_signing.md). If I need to distribute my sites as images instead of just deploying from source code.

## Containers

### Builds

[More about Buildah and building images](https://developers.redhat.com/blog/2019/02/21/podman-and-buildah-for-docker-users#what_is_buildah_and_why_would_i_use_it_)

Podman can do builds with Dockerfiles using `podman build`. Buildah is the technology which `podman build` leverages in a rudimentary way.

Best way to use Buildah: write Bash scripts for creating your images. Alternative: [Containerfile](https://www.mankier.com/5/Containerfile).

### Commands

Some commands require root privileges; if I ever need to set up a container that does not require root, visit [here](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md).

##### `podman run`

Run a container. `-d` for detached mode.

##### `podman ps`

List running containers. `-a` for list all.

##### `sudo podman container checkpoint <container_id>`

Checkpointing a container saves the state (ala VirtualBox). The point can be restored with `sudo podman container restore <container_id>`.

Checkpointing can also be used when migrating a container from one host to another (see [here](https://github.com/containers/podman/blob/main/docs/tutorials/podman_tutorial.md#migrate-the-container)).

##### `podman stop`

Stop a container. `--latest`.

##### `podman rm`

Remove a container. `--latest`.

##### `podman rmi`

Remove an image. `-a` for remove all.

## Networking

[https://github.com/containers/podman/blob/main/docs/tutorials/basic_networking.md](https://github.com/containers/podman/blob/main/docs/tutorials/basic_networking.md)

[https://www.redhat.com/sysadmin/container-networking-podman](https://www.redhat.com/sysadmin/container-networking-podman)

The podman service includes a virtual network, with Container Network Interface (CNI) plugins and a bridge ala Docker. This is the default networking mode for rootful containers.

Firewalls: Can have an impact on inbound network traffic/port mapping. Also, "If container traffic does not seem to work properly, check the firewall and allow traffic on ports the container is using."

### Bridge Network

Internal, virtual network that connects the container and the host. Can allow a container to communicate outside the host.

### Commands

##### `podman network reload`

Restores the CNI iptables (if deleted by a firewall) without having to restart containers.

##### `podman network create`

Create other networks beyond the bridge network, or create a rootless bridge network.

##### `podman network connect`

Containers can be joined to a CNI network on create with `--network` or after with the above command. They can be disconnected with `podman network disconnect`.

## Pods

[https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods#podman_pods\_\_what_you_need_to_know](https://developers.redhat.com/blog/2019/01/15/podman-managing-containers-pods#podman_pods__what_you_need_to_know)

Podman pods are based on k8s pods. A pod is a group of containers with shared storage and network resources.

## Kubernetes

[https://www.redhat.com/sysadmin/podman-play-kube-updates](https://www.redhat.com/sysadmin/podman-play-kube-updates)

##### `podman generate kube`

Creates a YAML description of a Podman pod or container to run in Kubernetes.

##### `podman play kube`

Allows you to run Podman pods based on a k8s YAML file. Inverse of `generate kube`.
