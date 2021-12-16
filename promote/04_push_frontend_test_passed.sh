




docker tag soleng.jfrog.io/app1-docker-virtual/hello-world:latest soleng.jfrog.io/app1-docker-dev-local/frontend:1.0.1
docker push soleng.jfrog.io/app1-docker-dev-local/frontend:1.0.1

# 测试通过
appPath=app1-docker-dev-local/frontend/1.0.1/
curl -X PUT -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
"https://soleng.jfrog.io/artifactory/api/storage/${appPath}?properties=app.module=frontend;app.module.version=1.0.1;app.module.test.status=passed"


