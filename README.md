# docker

- local

        - config
        
                vi /etc/docker/daemon.json

                {
                "insecure-registries": [
                "182.92.214.141:8082"
                ]
                }

        - test

                docker pull mysql:5.7
                docker tag mysql:5.7 182.92.214.141:8082/docker-local/mysql:5.7
                docker login -u kyle 182.92.214.141:8082
                docker push 182.92.214.141:8082/docker-local/mysql:5.7
        
                docker login -u kyle 182.92.214.141:8082
                docker pull 182.92.214.141:8082/docker-virtual/hello-world
                docker tag 182.92.214.141:8082/docker-virtual/hello-world:latest 182.92.214.141:8082/docker-local/hello-world:v1
                docker push 182.92.214.141:8082/docker-local/hello-world:v1
                docker pull 182.92.214.141:8082/docker-virtual/hello-world:v1
                
- docker pipeline demo

        - create jfrog repo
        
                docker-dev-local
                docker-remote
                docker-virtual

        - install & configure nginx
        
                brew install nginx

                The default port has been set in /usr/local/etc/nginx/nginx.conf to 8080 so that
                nginx can run without sudo.

                nginx
                nginx -s reload

        - config http proxy
        
                generate artifactory.conf , put content of it into nginx.conf

        - install docker desktop (mac 10.14 required)
        
                docker run hello-world

                        - fix
                        docker desktop -> setting -> docker engine -> configure insecure registry pointing to the registry's ip
                        if 80 as port, do not omit it

                        - test (use IP, localhost/127.0.0.1 won't work)
                        docker login -u kyle -p xxx 192.168.0.102:80

        - test
        
                docker.groovy
                use https://github.com/jfrog/project-examples as git project


