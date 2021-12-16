node {
    def server = Artifactory.server 'art1'
    def rtDocker = Artifactory.docker server: server
    def buildInfo = Artifactory.newBuildInfo()
    def ARTIFACTORY_DOCKER_REGISTRY='soleng.jfrog.io/app1-docker-dev-local' // x.x.x.x:80
    def imagePath = ARTIFACTORY_DOCKER_REGISTRY + '/hello-world:latest'

    stage ('Clone') {
        git url: 'https://github.com.cnpmjs.org/kyle11235/docker-example.git'
    }

    stage ('Add properties') {
        // Attach custom properties to the published artifacts:
        rtDocker.addProperty("project-name", "docker-example").addProperty("status", "stable")
    }

    stage ('Docker login') {
        withCredentials([usernamePassword(credentialsId: 'art_username_password', passwordVariable: 'ART_PASSWORD', usernameVariable: 'ART_USERNAME')]) {
            sh 'docker login -u ${ART_USERNAME} -p ${ART_PASSWORD} soleng.jfrog.io'
        }
    }

    stage ('Build docker image') {
        docker.build(imagePath, '.')
    }

    stage ('Push image to Artifactory') {
        buildInfo = rtDocker.push imagePath, 'app1-docker-dev-local'
    }

    stage ('Pull image from Artifactory') {
        sh 'docker pull ' + imagePath
    }

    stage ('Publish build info') {
        server.publishBuildInfo buildInfo
    }
}