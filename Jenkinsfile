pipeline {
  
    environment {
      registry = "asia.gcr.io/white-berm-210209/jenkins-slave-builder"
      registryCredential = 'my-project-gcr-credentials'
      commitId = env.GIT_COMMIT.substring(0,4)
    }
    agent {
        docker {
            image 'docker'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
        }
    }
    stages {
        stage('Build') {
            steps {              
               
               script {                  
                  docker.build registry + ":" + commitId 
               }              
            }
        }
    }
}
