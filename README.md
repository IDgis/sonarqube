# sonarqube
Setup sonarqube with postgresql (locally)

## Prerequisites
Windows DOS terminal which has the Git bash ``sh`` command available.   
Installed docker Toolbox.   

Goto the project in git:   
``cd C:\Users\USER\git\sonarqube``

## Prepare environment
### Create a docker machine

First create a 'headless' machine named "sonarqube"

``docker-machine create --driver=virtualbox --virtualbox-memory=3072 --virtualbox-cpu-count=2 --virtualbox-disk-size="32000" --virtualbox-ui-type "headless" sonarqube``

Then find the HOST IP adres e.g. ``192.168.99.100``  

``docker-machine env sonarqube``

## Build & Run
Execute the following command to build and run:

``sh deploy.sh``

## Verify
### General
Check if both containers are running and find the container id's.

``docker ps``

### SonarQube
#### Connect with browser
In a browser connect to the SonarQube admin interface:

``http://192.168.99.100:9000/``

Login with admin, admin

Make sure your sonar-scanner or sonarlinter connect to the url above

#### check sonarqube log 
``docker exec SONAR_CONTAINER_ID tail /opt/sonarqube/logs/sonar.log``
 
### postgres
#### Connect with pgAdmin

E.g. in pgAdmin connect to a server with the following properties    
```
Host: 192.168.99.100   
Port: 5432   
Maint DB: postgres  
Username: sonar   
Password: secret    
```

Find the database with name ``sonar``   

#### check postgresql data path 
``docker exec POSTGRES_CONTAINER_ID ls -l /var/lib/postgresql/data``


