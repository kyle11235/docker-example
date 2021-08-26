node {
    def server = Artifactory.server 'art1'
    def rtDocker = Artifactory.docker server: server
    def buildInfo = Artifactory.newBuildInfo()
    def ARTIFACTORY_DOCKER_REGISTRY='182.92.214.141:8082/docker-dev-local' // x.x.x.x:80

    stage ('Clone') {
        git url: 'https://github.com/JFrog/project-examples.git'
    }

    stage ('Add properties') {
        // Attach custom properties to the published artifacts:
        rtDocker.addProperty("project-name", "docker1").addProperty("status", "stable")
    }

    stage ('Docker login') {
        withCredentials([usernamePassword(credentialsId: 'art_username_password', passwordVariable: 'ART_PASSWORD', usernameVariable: 'ART_USERNAME')]) {
            sh 'docker login -u ${ART_USERNAME} -p ${ART_PASSWORD} 182.92.214.141:8082'
        }
    }

    stage ('Build docker image') {
        docker.build(ARTIFACTORY_DOCKER_REGISTRY + '/hello-world:latest', 'jenkins-examples/pipeline-examples/resources')
    }

    stage ('Push image to Artifactory') {
        buildInfo = rtDocker.push ARTIFACTORY_DOCKER_REGISTRY + '/hello-world:latest', 'docker-dev-local'
    }

    stage ('Pull image from Artifactory') {
        sh 'docker pull 182.92.214.141:8082/docker-virtual/hello-world'
    }

    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
    }
}