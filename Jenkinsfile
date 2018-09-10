pipeline {
  
    environment {
        registry = "asia.gcr.io/white-berm-210209/jenkins-slave-builder"
        commitId = env.GIT_COMMIT.substring(0,7)
    }
  
    agent {
        label 'gcr-docker-container-label'
    }
  
    stages {
        stage('Build') {
            steps {              
                withCredentials([file(credentialsId: 'gcr-auth-file', variable: 'GC_KEY')])  {
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
