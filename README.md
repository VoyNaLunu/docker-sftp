# Docker SFTP

## Description
Very basic and easy to modify locally built alpine container that provides SFTP using openssh-server  

## How to run

1. Clone the repository  
`git clone https://github.com/VoyNaLunu/docker-sftp.git`  

2. Move into the cloned folder  
`cd docker-sftp/`

3. Copy .env.example to .env and fill in the values  
`cp .env.example .env`  

4. Modify docker-compose.yml to your liking and run it  
`docker compose up -d`
