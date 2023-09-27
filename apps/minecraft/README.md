# Minecraft

I set this up as an alternative to running my minecraft world on AWS Fargate.
This is a Minecraft Java world that runs on my Raspberry Pi cluster. I store all save
files on my Synology NAS

## Quick Start

To run the latest stable version run

    docker run -d -it -p 25565:25565 -e EULA=TRUE itzg/minecraft-server

## Helm Install

    helm repo add itzg https://itzg.github.io/minecraft-server-charts/
    helm search repo itzg

## Resources 
https://github.com/itzg/docker-minecraft-server
