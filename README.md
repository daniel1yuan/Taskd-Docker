# Taskd-Docker
Task Warrior server deployed with docker

## Introduction
Taskd is the server for [taskwarrior](https://taskwarrior.org/), a highly configuration task management system. This repo serves as a easy way to deploy the taskd server in a docker container and generate the certificates needed for communicating from the taskwarrior client.

## Installation
1. Clone the repo
2. Create a `taskd/server.config` file, which is a mirror of the vars file
3. Create a `./var` folder and provide permissions to the right user so the docker container user can read and write from it 
4. run `docker-compose up`, which will launch the container and generate a configuration for the server if one doesn't exist already
5. Create users and organizations as needed on the server. [Guide](https://taskwarrior.org/docs/taskserver/user.html)
6. Securely copy the client and user certificates and keys, and install into your client using this [guide](https://taskwarrior.org/docs/taskserver/taskwarrior.html)
7. Sync client to the server using this [guide](https://taskwarrior.org/docs/taskserver/sync.html)

## Dependencies
* docker
* docker-compose (optional, but you would need to apply all the configs in `docker-compose.yml` manually when building/running the container)
