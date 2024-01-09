#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'master', url: 'https://github.com/matmajk/CICD-jenkins-terraform-aws-project.git'
            }
        }
        stage('Bring up') {
            steps {
                withAWS(credentials: 'terraform-aws-credentials') {
                sh '''#!/bin/bash -e
                cd terraform
                terraform init
                terraform validate
                terraform plan -var-file="terraform.tfvars" -out current_plan.tfplan
                terraform apply "current_plan.tfplan"
                terraform output > output.txt
                cd ..
                python3 ./parser.py
                cd ansible
                ansible-playbook -i hosts project.yml
                '''
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
