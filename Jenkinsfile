pipeline {
  agent any
  stages {
    stage('stage1') {
      parallel {
        stage('stage1') {
          steps {
            sh '''terraform init
'''
          }
        }

        stage('') {
          steps {
            awsIdentity()
          }
        }

      }
    }

    stage('stage2') {
      steps {
        sh 'terraform apply'
      }
    }

    stage('confirm') {
      steps {
        input 'Confirm haha'
      }
    }

    stage('destroy1') {
      steps {
        sh 'terraform destroy'
      }
    }

  }
}