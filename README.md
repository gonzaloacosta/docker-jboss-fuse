# JBoss FUSE 6.2.1 

# Archivos en el directorio raiz
	build.sh  
	Dockerfile  
	fuse-eap-installer-6.2.1.redhat-084.jar  
	jboss-eap-6.4.0.zip  
	run.sh

# Docker Build
docker build --rm --tag=jboss-fuse:6.2.1


# Docker Run
docker run -it -p 8080:8080 -p 9999:9999 -p 9990:9990 jboss-fuse:6.2.1

