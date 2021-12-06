

FROM=app1-docker-dev-local
curl -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-X DELETE "https://soleng.jfrog.io/artifactory/$FROM"


FROM=app1-docker-test-local
curl -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-X DELETE "https://soleng.jfrog.io/artifactory/$FROM"


FROM=app1-docker-prod-local
curl -H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-X DELETE "https://soleng.jfrog.io/artifactory/$FROM"