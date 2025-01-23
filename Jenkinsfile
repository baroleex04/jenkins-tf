pipeline {
    agent any

    stages {
        stage('Install Terraform') {
            steps {
                script {
                    // Download the correct Terraform version
                    sh '''
                        curl -LO https://releases.hashicorp.com/terraform/1.3.7/terraform_1.3.7_linux_amd64.zip
                        unzip -o terraform_1.3.7_linux_amd64.zip
                        mv terraform /usr/local/bin/
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
