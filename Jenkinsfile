#!/usr/bin/env groovy

pipeline {
    agent any
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    }
    stages {
        stage('Fetch code') {
            steps {
                git branch: 'test-Jenkinsfile', url: 'https://github.com/matmajk/CICD-jenkins-terraform-aws-project'
            }
        }
        stage('Prepare Terraform Plan') {
            steps {
                withAWS(credentials: 'terraform-aws-credentials') {
                    dir('terraform') {
                        sh 'terraform init -input=false'
                        sh 'terraform validate'
                        sh 'terraform plan -input=false -var-file="terraform.tfvars" -out current_plan.tfplan'
                        sh 'terraform show -no-color current_plan.tfplan > tfplan.txt'
                    }
                }
            }
            post {
                always {
                    dir('terraform') {
                        archiveArtifacts artifacts: 'tfplan.txt'
                    }
                }
            }
        }
        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?",
                        parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }
        stage('Terraform Apply') {
            steps {
                withAWS(credentials: 'terraform-aws-credentials') {
                    dir('terraform') {
                        sh "terraform apply -input=false current_plan.tfplan"
                        sh 'terraform output > output.txt'
                    }
                }
            }
        }
        stage('Ansible configuration') {
            steps {
                withAWS(credentials: 'terraform-aws-credentials') {
                    sh 'ls'
                    sh 'pwd'
                    sh 'python3 ./parser.py'
                    dir('ansible') {
                        sh 'ansible-playbook -i hosts project.yml'
                    }
                }
            }
        }
    }
    post {
        failure {
            withAWS(credentials: 'terraform-aws-credentials') {
                dir('terraform') {
                    sh "terraform apply -destroy -auto-approve"
                }
            }
            cleanWs()
        }
        aborted{
            withAWS(credentials: 'terraform-aws-credentials') {
                dir('terraform') {
                    sh "terraform apply -destroy -auto-approve"
                }
            }
            cleanWs()
        }
        success {
            cleanWs()
        }
    }
}