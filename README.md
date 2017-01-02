# Setup Sonarqube with postgresql
This guide gives step-by-step instructions to run Sonarqube 6.2 with a postgres 9.5 database using docker.
## Linux

### Prerequisites
Installed docker (1.12 +) and docker-composer (1.8 +).   

### Build and run
#### Clone from git 
Goto a folder where the git project can be cloned. 

``git clone https://github.com/IDgis/sonarqube.git``
#### Build and run
``cd sonarqube``    
``sh deploy.sh``

#### Verify
Verify that the containers are running    
``docker ps``

##### Connect with browser
In a browser connect to the SonarQube admin interface:

``http://localhost:9009/``

##### Apache configuration
An apache configuration will be needed if the installation is done on a linux server to be used company wide.    
An apache configuration has not been added to this project.
 
## Windows 
Using docker-machine.
### Prerequisites
Windows DOS terminal which has the Git bash ``sh`` command available.      
Installed docker Toolbox.   
Installed Oracle Virtualbox.   

Goto the project in git:   
``cd C:\Users\USER\git\sonarqube``

### Prepare environment
#### Create a docker machine
First create a 'headless' machine named "sonarqube"

``docker-machine create --driver=virtualbox --virtualbox-memory=3072 --virtualbox-cpu-count=2 --virtualbox-disk-size="32000" --virtualbox-ui-type "headless" sonarqube``

Execute the following command:    
``docker-machine env sonarqube``

Execute the last line from the output of this command:       
``@FOR /f "tokens=*" %i IN ('docker-machine env sonarqube') DO @%i``.

### Build & Run
Start the sonarqube machine headless in VirtualBox.      
Execute the following command to build and run:

``sh deploy.sh``

### Verify
Find the machine IP adres (e.g. ``192.168.99.100``) by executing:   
``docker-machine env sonarqube``.  

#### General
Check if both containers are running and find the container id's.

``docker ps``

#### SonarQube
##### Connect with browser
In a browser connect to the SonarQube admin interface:

``http://192.168.99.100:9009/``

Login with admin, admin

Make sure your sonar-scanner or sonarlinter connects to the url above.   
For example: edit sonar-scanner-2.8/conf/sonar-scanner.properties to point to the sonar server:

``#----- Default SonarQube server``   
``sonar.host.url=http://192.168.99.100:9009/``
 
##### check sonarqube log 
``docker exec SONAR_CONTAINER_ID tail /opt/sonarqube/logs/sonar.log``
 
#### postgres
##### Connect with pgAdmin

E.g. in pgAdmin connect to a server with the following properties:    

```
Host: 192.168.99.100   
Port: 5432   
Maint DB: postgres  
Username: sonar   
Password: secret    
```

Find the database with name ``sonar``   

##### check postgresql data path 
``docker exec POSTGRES_CONTAINER_ID ls -l /var/lib/postgresql/data``

## Using the sonar server 
In a browser connect to the SonarQube admin interface.

e.g.: ``http://localhost:9009/``
 
Login with admin, admin

Goto Administration / System / Upgrade center

Install language and scm plugins (Java, Javascript, Git, GitHub) 

Make sure your sonar-scanner or sonarlinter connects to the server url.   
For example: edit sonar-scanner-2.8/conf/sonar-scanner.properties to point to the sonar server:

``#----- Default SonarQube server``   
``sonar.host.url=http://localhost:9009/``

