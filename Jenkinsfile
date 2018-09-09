pipeline {
  
    environment {
      registry = "asia.gcr.io/white-berm-210209/jenkins-slave-builder"
      registryCredential = 'my-project-gcr-credentials'
      commitId = env.GIT_COMMIT.substring(0,4)
      //gcrCreds=credentials('my-project-gcr-credentials')
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
              withCredentials([file(credentialsId: 'gcr-auth-file', variable: 'GC_KEY')])  {
                container('gcr-docker-container') {
                  sh "docker build -t \"\${registry}:\${commitId}\" ."
                  sh "echo \$GC_KEY | base64 -d  > creds.json"
                  sh "docker login -u _json_key -p \"\$(cat creds.json)\" https://asia.gcr.io"
                  sh "docker push \${registry}:\${commitId}"
                }
              }
            }
        }
    }
}
