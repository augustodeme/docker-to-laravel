# Docker to laravel

A repository of Docker to working with laravel.

## Get Started
After clone this repository, you need to configure the docker changing some files:

### makefile
1-) Change 'projectname' to your project name;

### docker-compose.yml
1-) Change 'projectname' to your project name;

2-) Change image to other php version name (optional)

3-) Change the mysql infos for the local db on docker
* Attention to MYSQL_DATABASE, this name must be EXACTLY same as the directory in /database/dbfolder/data

### docker/Dockerfile
1-) Change 'projectname' to your project name;

2-) Change the php version on first line (optional)

## After configure the project

    Install Laravel on /src folder (That's your root folder project).

    After installing laravel in the src folder, run that command on your terminal (in the same directory as the makefile file):

    make dev/local