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
      steps {
        echo 'hello'
      }
    }

  }
}