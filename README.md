# docker-compose-autoinstall
Streamline the process of installing docker with docker-compose on ubuntu servers.

Run the following command in your ubuntu server to download and execute the script. Root permissions are required for this script to operate.

`sh -c "$(curl -fsSL https://raw.githubusercontent.com/seth-rah/docker-compose-autoinstall/master/install.sh)"`

## Features

1. Remove / purge depreciated docker versions
2. Install docker-ce
3. Install docker-compose
4. Give provided user privileges to execute docker commands
5. Give docker-compose execution rights
