




docker tag 182.92.214.141:8082/public-docker-virtual/hello-world:latest 182.92.214.141:8082/app1-docker-dev-local/frontend:1.0.1
docker push 182.92.214.141:8082/app1-docker-dev-local/frontend:1.0.1

appPath=app1-docker-dev-local/frontend/1.0.1/
curl -X PUT -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
"http://182.92.214.141:8081/artifactory/api/storage/${appPath}?properties=app.module=frontend;app.module.version=1.0.1;app.module.test.status=passed"


