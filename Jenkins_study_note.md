Jenkins
( automation platform allow you to build/test/deploy
software using pipelines and more, e.g.: run bash/python script as well
as ansible playbooks )

feature:
	web gui
	can be boosted from Docker

Infrastructure：
	Jenkins (work depaching maste)
		|
		| (ssh)
		|
	Agent works ( local / online: Docker/Kubernetes/AWS ec2 fleet manager,
	needs java/building tools  )

Build type:

1) Freestyle
	 ( linux shell script like, use webpage UI ... )
2) Pipelines
	 ( Groovy -> sections(Clone, Build, test, Package, Deploy) )

Install: ( with blue Ocean )
1) git clone
$ git clone https://github.com/devopsjourney1/jenkins-101.git

2) create docker image at current directory
$ cd jenkins-101
$ docker build -t myjenkins-blueocean:2.332.3-1 .

3) create network (docker network ls --- check if jenkins already exist)

$ docker network create jenkins

4) run this jenkins docker image in a container...

# fixed the time zone when run docker Mar9

$ docker run --name jenkins-blueocean --restart=on-failure --detach \
--network jenkins --env DOCKER_HOST=tcp://docker:2376 \
--env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
--volume jenkins-data:/var/jenkins_home \
--volume jenkins-docker-certs:/certs/client:ro \
--publish 8080:8080 --publish 50000:50000 myjenkins-blueocean:2.332.3-1
-e JAVA_OPTS=-Duser.timezone=America/New_York

In jenkins( build-in node ):
1) get passwd
$ docker exec jenkins-blueocean cat /var/jenkins_home/secrets/initialAdminPassword

2) install jenkins plugin: e.g.: Ant and Gradle and etc. .
3) user and passwds
4) instance configuration
5) Jenkins URL

Jenkins UI:
				Dashboard
				Manage Jenkins
							 setup a agent:

new item:
		free style
		source Code management
					 Git
					 for a private git: enter "Credentials" (ssh?)
		Build Triggers:
					Github hook trigger for GITScm Polling (maybe difficult if behind a firewall)
					Poll SCM (build time by time)
		Build environments:

Jenkins Filesystem:
$ docker exec -it jenkins-blueocean bash
in the jenkins image container
we are at the root directary
and the home path is var/jenkins_home as we set in docker run --volume ...

// side note: using docker window to boost docker, then run the image of a containter...
// accessing to docker container: 1) docker ps // to get the docker container id; 2) docker exec -it <container_id> /bin/bash

Feb 27
Create Jenkins node ( local permanent node ( via ssh ) / cloud {docker, kubernetes, aws} ) Dashboard -> manage Jenkins -> New Node and cloulds
-> cloud
 -> plugin manager
 -> Docker, Kubernetes, Amazon EC2 etc...

-> after reboot

dashboard -> manage Jenkins -> plugin manager

uri of the host that running docker windows ( via a docker container ) ...

we then have jenkins image and docker image running, we need another image to connect the jenkins image and docker image

which is a alpine/cocat image that will provide a intermedium layer

docker run -d --restart=always -p 127.0.0.1:2376:2375 \
--network jenkins -v /var/run/docker.sock:/var/run/docker.sock \
alpine/socat tcp-listen:2375,fork,reuseaddr unix-connect:/var/run/docker.sock


docker inspect <container_id> | grep IPAddress


Docker Pipelines: 
check the Jenkinsfile in the project home directory
1) General configerations:
	Discard old Builds
		Strategy
		Days to keep builds
		Max # of Builds
2) Build Triggers
	Github hook trigger for GITScm polling
	Poll SCM
3) Build (freestyle)
	Execute shell ( Mac and linux ) or Execute windows Batch Command


4) Pipeline: 
	credentials: (study the credential() function and the returns )
	branch ( /master or /main or whatever ) 
	Script Path


Add a Git web hooks:
// on Jenkins job configure page
1) GitHub hook trigger for GITScm polling 
// on Github your repositery -> setting -> webhooks -> Add webhook
* Payload URL: (ngrok.com for setup proxy url ) and choose content type as *** application/json ***  
* select triggering event: push 

Mar 13 job1->job2->job3 (require a "Devliver pipeline" Jenkins plug-in)
1) free style add a a post-build trigger

2) pepeline: (a continuous delivery pipeline using Jenkins)
e.g.:
build job
 ->
deploy job
 ->
test job
https://www.youtube.com/watch?v=lCSMialN7kU

you want to create "view" also 


Mar 23 summary:
1) build 
- check your git head, and make sure no build conflicts 

2) unit-tests
- check 
	-1 your git head 
	-2 if build sccuessed
	-3 achieve your git-head for a sccuess tests

3) advance to dev 
	- check your 
4) system tests

5) advance to prod 