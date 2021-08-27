




curl -X POST 'http://182.92.214.141:8081/artifactory/api/search/aql' \
-H 'X-JFrog-Art-Api: '"$ART_API_KEY"'' \
-H 'Content-Type: text/plain' \
--data-raw 'items.find(
    {  
        "repo": {"$eq" : "app1-docker-dev-local"},
        "name": {"$eq" : "manifest.json"},
        "@app.module.version": {"$match" : "1.0.*"},
        "@app.module.test.status": {"$eq" : "passed"}
    }
).sort({"$desc" : ["path"]})'

