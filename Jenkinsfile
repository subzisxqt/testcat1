pipeline {
  agent any
  stages {
    stage('stage1') {
      steps {
        sh '''terraform init
'''
      }
    }

    stage('stage2') {
      steps {
        sh 'terraform apply'
      }
    }

    stage('') {
      steps {
        input 'Confirm haha'
      }
    }

  }
}