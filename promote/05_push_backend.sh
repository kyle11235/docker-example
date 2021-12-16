



docker tag soleng.jfrog.io/app1-docker-virtual/hello-world:latest soleng.jfrog.io/app1-docker-dev-local/backend:1.0.0
docker push soleng.jfrog.io/app1-docker-dev-local/backend:1.0.0

# 测试通过
appPath=app1-docker-dev-local/backend/1.0.0/
curl -X PUT -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
"https://soleng.jfrog.io/artifactory/api/storage/${appPath}?properties=app.module=backend;app.module.version=1.0.0;app.module.test.status=passed"


