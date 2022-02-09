# Setup

```
pip install django django-environ gunicorn psycopg2-binary
cp .env.example .env
```

## Commands

From [https://www.mankier.com/5/Containerfile](https://www.mankier.com/5/Containerfile).

Check the Containerfile for the image build scripts.

```
podman build . -t first-django
podman images
```

Image ID was: `338206034d63`. Repository: `localhost/first-django`, Tag: `latest`.

Podman stores images locally in `~/.local/share/containers/storage/`. When run by root, Podman stores images in `/var/lib/containers/`.

```bash
podman network ls
# If there is no network, create the default
podman network create
# Network name is `podman`.
podman network ls
```

```bash
# Running the container, forwarding the gunicorn-port:host-port
podman run -dt --name django-server -p 8000:8000/tcp localhost/first-django
# If you need to open bash on the container
podman exec -it django-server bash
```
