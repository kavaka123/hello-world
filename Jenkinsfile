node {
    stage('checkout scm') {
        checkout scm
    }
    
    stage('Maven build'){
      withEnv(['MAVEN_HOME=/home/aditya/Desktop/learnings/maven3/apache-maven-3.6.3/bin/mvn']) {
            sh '$MAVEN_HOME clean install package'
        }
    }
    
    stage('Docker build') {
        sh "docker build -t avantaditya/hello-world:${BUILD_NUMBER} ."
	sh "docker push avantaditya/hello-world:${BUILD_NUMBER}"
    }
}
