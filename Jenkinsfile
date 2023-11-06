#!/usr/bin/env groovy

pipeline {
    agent any
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'test', url: 'https://github.com/matmajk/python-web-db-project.git'
            }
        }
        stage('Bring up') {
            steps {
                sh '''#!/bin/bash -e
                cd terraform
                terraform init
                terraform validate
                terraform plan -var-file="terraform.tfvars" -out current_plan.tfplan
                terraform apply "current_plan.tfplan"
                terraform output > output.txt
                '''
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
