git clone https://github.com/DevHopps/guacamole-docker.git

cd guacamole-docker


Change the Postgres password in the compose file!
You might also have to change the port, guacamole is using (default is 8080).


Attention: The init_guacamole script **needs** to be run first!

chmod +x init_guacamole.sh

sudo ./init_guacamole.sh


After everything is done you can start/stop the containers via docker compose.

If the guacd container started succesfully, you should be able to open guacamole now.
You can check the status via *sudo docker compose ps*