sudo docker exec -it postgresql bash -c "psql -U ${SENDMIND_POSTGRES_USER} -d ${SENDMIND_POSTGRES_DB} -c 'CREATE DATABASE glitchtip;'"
sudo docker exec -it glitchtip bash
python manage.py migrate
python manage.py createsuperuser
