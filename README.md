# docker example

- setup

        - config
        
                vi /etc/docker/daemon.json

                {
                "insecure-registries": [
                "182.92.214.141:8082"
                ]
                }

        - create jfrog repo
        
                app1-docker-dev-local
                app1-docker-test-local
                app1-docker-prod-local

                public-docker-dockerhub-remote
                public-docker-virtual (inlcude the remote)

- local test

                - pull from dockerhub
                docker pull mysql:5.7

                - push to my local
                docker tag mysql:5.7 182.92.214.141:8082/app1-docker-dev-local/mysql:5.7
                docker login -u kyle 182.92.214.141:8082
                docker push 182.92.214.141:8082/app1-docker-dev-local/mysql:5.7
        
                - pull from my virtual (dockerhub inside)
                docker login -u kyle 182.92.214.141:8082
                docker pull 182.92.214.141:8082/public-docker-virtual/hello-world

                - push to my local
                docker tag 182.92.214.141:8082/public-docker-virtual/hello-world:latest 182.92.214.141:8082/app1-docker-dev-local/hello-world:v1
                docker push 182.92.214.141:8082/app1-docker-dev-local/hello-world:v1

                - pull from my local
                docker pull 182.92.214.141:8082/app1-docker-dev-local/hello-world:v1
                
- jenkins demo

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

- promote demo

        check ./promote

