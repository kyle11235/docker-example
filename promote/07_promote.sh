



curl -X POST -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-H "Content-Type: application/json" \
"http://182.92.214.141:8081/artifactory/api/docker/app1-docker-dev-local/v2/promote" \
-d '{"targetRepo":"app1-docker-test-local","dockerRepository":"frontend", "tag" : "1.0.1", "targetTag" : "latest", "copy" : "true"}'

curl -X POST -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-H "Content-Type: application/json" \
"http://182.92.214.141:8081/artifactory/api/docker/app1-docker-dev-local/v2/promote" \
-d '{"targetRepo":"app1-docker-test-local","dockerRepository":"backend", "tag" : "1.0.0", "targetTag" : "latest", "copy" : "true"}'



