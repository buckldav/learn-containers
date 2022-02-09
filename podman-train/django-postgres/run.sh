podman pod stop -a && podman pod rm -a
podman pod create --name django-postgres -p 5432:5432/tcp -p 8000:8000/tcp 
podman run -dt --name dj-postgres --pod django-postgres localhost/dj-postgres
#python manage.py migrate
podman run -dt --name dj-gunicorn --pod django-postgres localhost/dj-gunicorn