myip=$(hostname -I | awk '{print $1}')
echo -ne "\033[1;32mEnter port:\033[1;37m: "; read myport
echo -ne "\033[1;32mEnter username:\033[1;37m: "; read myusername
echo -ne "\033[1;32mEnter password:\033[1;37m: "; read mypassword




curl =fsSL https://get.docker.com | sh
mkdir -p OwnCloud
cd OwnCloud


cat << EOF > .env
OWNCLOUD_VERSION=latest
OWNCLOUD_DOMAIN=localhost:$myport
OWNCLOUD_TRUSTED_DOMAINS=localhost, $myip:$myport
ADMIN_USERNAME=$myusername
ADMIN_PASSWORD=$mypassword
HTTP_PORT=$myport
EOF

curl https://raw.githubusercontent.com/sons-of-liberty/OwnCloud/main/docker-compose.yml > docker-compose.yml

docker compose up -d
