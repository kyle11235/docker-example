



docker tag 182.92.214.141:8082/public-docker-virtual/hello-world:latest 182.92.214.141:8082/app1-docker-dev-local/backend:1.0.0
docker push 182.92.214.141:8082/app1-docker-dev-local/backend:1.0.0

appPath=app1-docker-dev-local/backend/1.0.0/
curl -X PUT -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
"https://soleng.jfrog.io/artifactory/api/storage/${appPath}?properties=app.module=backend;app.module.version=1.0.0;app.module.test.status=passed"


