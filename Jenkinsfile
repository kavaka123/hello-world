node {
try{
    stage('git clone') {
        checkout scm
    }

    stage('Maven build'){
      withEnv(['MAVEN_HOME=/home/aditya/Desktop/learnings/maven3/apache-maven-3.6.3/bin/mvn']) {
            sh '$MAVEN_HOME clean install package'
        }
    }

    stage('Docker build and push') {
        docker.withRegistry('', 'dockerhub') {
           def customImage = docker.build("avantaditya/hello-world:${env.BUILD_ID}")
           customImage.push()
        }
    }
    
    stage('k8s deploy') {
        kubernetesDeploy configs: '**/*.yml', dockerCredentials: [[credentialsId: 'dockerhub']], kubeConfig: [path: ''], kubeconfigId: 'minikube_k8s', secretName: '', ssh: [sshCredentialsId: '*', sshServer: ''], textCredentials: [certificateAuthorityData: '', clientCertificateData: '', clientKeyData: '', serverUrl: 'https://']
    }
} finally {
    emailext attachLog: true, body: '<h1>Please check the logs at: ${BUILD_URL}</h1>', mimeType: 'text/html', subject: '${PROJECT_NAME} run is a ${BUILD_STATUS}', to: 'avant.aditya@gmail.com'
}

}

