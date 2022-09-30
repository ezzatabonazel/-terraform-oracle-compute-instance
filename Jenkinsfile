pipeline {
    agent any
    tools {
  terraform 'terraform'
}
stages {
        stage('terraform format check') {
            steps{
               sh 'terraform -chdir=./oci-terraform/ fmt'
            }
        }
        stage('terrafrom init'){
            steps{
              
                    sh 'terraform -chdir=./oci-terraform/ init'
            }
        }
            stage('terrafrom apply'){
                steps{
                   
                         sh 'terraform -chdir=./oci-terraform/ apply  --auto-approve'
                    
                }
            }
    }
}