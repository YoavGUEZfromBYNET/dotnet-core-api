pipeline {
  agent {
    node {
      label 'docker-vm'
    }

  }
  stages {
    stage('checkout code') {
      steps {
        git(url: 'https://github.com/lidorg-dev/dotnet-core-api.git', branch: 'master', changelog: true, poll: true)
      }
    }

    stage('Build Image of Docker') {
      steps {
        sh 'docker build -t lidorlg/todoapi:${BUILD_ID} .'
      }
    }

    stage('Upload Docker Image to Repo') {
      parallel {
        stage('Upload Docker Image to Repo') {
          steps {
            withDockerRegistry(credentialsId: 'docker-hub-creds', url: 'https://index.docker.io/v1/') {
              sh "docker push lidorlg/todoapi:${BUILD_ID}"
            }

          }
        }

        stage('RUN and TEST the IMAGE') {
          steps {
            sh '''docker run -itd -p 80:80 --name todoapi lidorlg/todoapi:${BUILD_ID} 
 && curl localhost:80 && docker stop todoapi && docker rm todoapi 
'''
          }
        }

      }
    }

  }
}