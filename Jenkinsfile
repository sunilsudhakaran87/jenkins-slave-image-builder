pipeline {
  
    environment {
        registry = "asia.gcr.io/strong-eon-217812/jenkins-slave-builder"
        commitId = env.GIT_COMMIT.substring(0,6)
    }
  
    agent {
        label 'gcr-docker-container-label'
    }
  
    stages {
        stage('Build') {
            steps {              
                withCredentials([file(credentialsId: 'gcr-secrets-file', variable: 'GC_KEY')])  {
                    container('gcr-docker-container') {
                        sh '''
                            docker build -t "${registry}:${commitId}" .
                            cat ${GC_KEY} | docker login -u _json_key --password-stdin https://asia.gcr.io
                            docker push ${registry}:${commitId}
                        '''
                    }
                }
            }
        }
    }
}
