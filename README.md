# Alfresco Process Services Docker Deployment
Docker Compose template for deploying the Alfresco Process Services Platform.

The goal of this project is to help system administrators to manage a APS infrastructure deployed with Docker where they also need to configure parameters or install extensions.
For developers interested to build extensions please see the [Alfresco Process Services SDK](https://github.com/OpenPj/alfresco-process-services-project-sdk).

The architecture template will help you deploying APS for you with the following tested components:

* activiti-app 2.1.0
* activiti-admin 2.1.0
* ElasticSearch 7.13.2
* PostgreSQL 13.1

Each component will have its own Docker Volume for managing the storage:

* `aps-db-sa-volume`: database storage for activiti-app
* `aps-contentstore-sa-volume`: file storage for attachments
* `aps-es-sa-volume`: file storage for search indexes
* `aps-admin-db-sa-volume`: database storage for activiti-admin

The provided run script will create these volumes for you.


# Getting started

Use these instructions to get started with deploying your Alfresco Process Services Platform with Docker

## Prerequisites
   
Before using this project you have to configure the following components:
* Docker - Latest stable version
* A valid APS license

### Docker

1. Download and install [Docker](https://docs.docker.com/install/)

2. Verify the installation of Docker:

```
$ docker -v
Docker version 20.10.12, build e91ed57
``` 

3. Docker Compose is included as part of Windows and Mac Docker installers.
For Linux-based users, install both the component separately with the following:

* [Install Docker Engine](https://docs.docker.com/engine/install/)
* [Install Docker Compose](https://docs.docker.com/compose/install/)

4. Verify the installation of Docker Compose

```
$ docker-compose -v
docker-compose version 2.2.3
```

### APS WAR artifacts, extensions and licensing

1. Put your license in the `activiti-license` folder
2. Put the JDBC driver used by APS in the `jdbc-driver` folder
3. Put your activiti-app.war and activiti-admin.war in the `extensions` folder

## Configuration

The structure of the project allows you to configure and install extensions against the APS platform as the following:

* `admin/tomcat/conf`: put here all the Tomcat configuration files
* `jdbc-driver`: put here the JDBC driver for Activiti App and Activiti Admin
* `logging`: change your logging strategy here using logback.xml
* `properties`: change here your activiti-app and activiti-admin properties
* `activiti-license`: put here your valid APS license
* `docker-compose.yml`: change here your deployment structure
* `Dockerfile`: change here your container build for activiti-app
* `Dockerfile-admin`: change here your continer build for activiti-admin
* `extensions`: put here your Activiti App, Activiti Admin and extensions (activiti-app.war, activiti-admin.war, extensions JARs)

For more informations about how to build extensions please see [Alfresco Process Services SDK](https://github.com/OpenPj/alfresco-process-services-project-sdk).

## Deploying your containers

A run script is provided in two formats:

* `run.sh` for Linux and Mac users
* `run.bat` for Windows users

Run the following command to deploy:

```
./run.sh start
```

Stop with:

```
./run.sh stop
```

Purge Docker volumes with:

```
./run.sh purge
```

Return in tail with:

```
./run.sh tail
```

# Enterprise support
Official maintenance and support of this project is delivered by Zia Consulting
