echo "Creating required database..."

mkdir ./postgres-init >/dev/null 2>&1
docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > ./postgres-init/initdb.sql

echo "DB done!"
echo "Starting container using docker compose"

docker compose pull
docker compose up -d

echo "Waiting 30s before installing TOTP plugin..."
echo "If you don't want to install this plugin you can stop this script by pressing ctrl + c"

sleep 30s

echo "Stopping containers..."
docker compose down

echo "Installing plugins to correct folder"
mkdir guacamole_home/extensions
mv guacamole-auth-totp-1.4.0.jar guacamole_home/extensions/guacamole-auth-totp-1.4.0.jar

echo "Done installing, starting containers!"
docker compose up -d

sleep 5
echo "Guacamole should now be reachable via http://<host>:<port>!"