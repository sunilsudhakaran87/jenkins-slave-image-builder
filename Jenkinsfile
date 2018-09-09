pipeline {
  
    environment {
      registry = "asia.gcr.io/white-berm-210209/jenkins-slave-builder"
      registryCredential = 'my-project-gcr-credentials'
      commitId = env.GIT_COMMIT.substring(0,4)
    }
    agent {
        label 'gcr-docker-container-label'
    }
    stages {
        stage('Build') {
            steps {
              /*
               script {                  
                  docker.build registry + ":" + commitId 
               }
               */
              container('gcr-docker-container') {
                sh "docker build -t \"\${registry}\$:\${commitId}\""
                sh "docker push"
              }
            }
        }
    }
}
