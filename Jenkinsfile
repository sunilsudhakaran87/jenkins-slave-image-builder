pipeline {
  environment {
    registry = "asia.gcr.io/white-berm-210209/jenkins-slave-builder"
    registryCredential = 'my-project-gcr-credentials'
  }
  agent any
  stages {
    stage('Building image') {
      steps{
        script {
          def commitId = env.GIT_COMMIT.substring(0,4)
          docker.build registry + ":" + commitId
        }
      }
    }
  }
}
