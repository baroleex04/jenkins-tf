pipeline {
    agent any

    environment {
        TERRAFORM_BIN = '/home/jenkins/bin'
    }

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Download the correct Terraform version
                    sh '''
                        mkdir -p ${TERRAFORM_BIN}
                        curl -LO https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
                        unzip -o terraform_1.3.7_linux_amd64.zip -d ${TERRAFORM_BIN}
                        export PATH=${TERRAFORM_BIN}:$PATH
                        terraform --version
                    '''
                }
            }
        }
        stage('Terraform Plan and Apply') {
            steps {
                script {
                    // Your terraform plan and apply steps go here
                    sh '''
                        terraform init
                        terraform validate
                        terraform plan
                        terraform apply -auto-approve
                    '''
                }
            }
        }
    }
}
