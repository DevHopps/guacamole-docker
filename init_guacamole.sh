echo "Creating required database..."

mkdir ./postgres-init
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql
mv initdb.sql postgres-init/initdb.sql

echo "DB done!"
echo "Installing plugin to correct folder"
mkdir guacamole_home
mkdir guacamole_home/extensions
mv guacamole-auth-totp-1.4.0.jar guacamole_home/extensions/guacamole-auth-totp-1.4.0.jar

echo "Starting container using docker compose"
docker compose pull
docker compose up -d

sleep 5
echo "Guacamole should now be reachable via http://<host>:<port>/guacamole!"