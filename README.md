# docker example

- setup

        - config
        
                vi /etc/docker/daemon.json

                {
                "insecure-registries": [
                "soleng.jfrog.io"
                ]
                }

        - create jfrog repo
        
                app1-docker-dev-local (uncheck  'Block pushing of image manifest v2 schema 1')
                app1-docker-test-local (uncheck  'Block pushing of image manifest v2 schema 1')
                app1-docker-prod-local (uncheck  'Block pushing of image manifest v2 schema 1')
                
                app1-docker-dockerhub-remote
                app1-docker-virtual (inlcude the remote)

- local test

                - pull from dockerhub
                docker pull hello-world

                - push to my local
                docker tag hello-world soleng.jfrog.io/app1-docker-dev-local/hello-world:5.7
                docker login -u kyle soleng.jfrog.io
                docker push soleng.jfrog.io/app1-docker-dev-local/hello-world:5.7
        
                - pull from my virtual (dockerhub inside)
                docker login -u kyle soleng.jfrog.io
                docker pull soleng.jfrog.io/app1-docker-virtual/hello-world

                - push to my local
                docker tag soleng.jfrog.io/app1-docker-virtual/hello-world:latest soleng.jfrog.io/app1-docker-dev-local/hello-world:v1
                docker push soleng.jfrog.io/app1-docker-dev-local/hello-world:v1

                - pull from my local
                docker pull soleng.jfrog.io/app1-docker-dev-local/hello-world:v1
                
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
                use https://github.com/kyle11235/docker-example as git project

- promote demo

        check ./promote

