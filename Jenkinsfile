pipeline{
    agent any
    environment {
        GOOGLE_APPLICATION_CREDENTIALS = credentials('GOOGLE_APPLICATION_CREDENTIALS')
        SERVICE_ACCOUNT = "epam-demo-sa@epam-demo-325303.iam.gserviceaccount.com"
        GITHUB_URL = "https://github.com/LeonIrv/Stage-02"
    }
    tools {
        terraform 'terraform-latest'
    }

    stages{
        stage('Git Checkout'){
            steps{
                git credentialsId: 'git-user', url: "${GITHUB_URL}"
            }
        }
        stage('Auth'){
            steps{
                withCredentials([file(credentialsId: 'GOOGLE_APPLICATION_CREDENTIALS', variable: 'FILE')]) {
                    sh label: '', script: "gcloud auth activate-service-account ${SERVICE_ACCOUNT} --key-file $FILE --project epam-demo-325303";
                    sh label: '', script: "gcloud container clusters get-credentials epam-cluster --zone=us-central1-b";                    
                }
                
            }
        }
        stage('Secrets Deploy K8s'){
            steps{
                script {
                    INSTANCE_NAME = sh(label: '', script: "gcloud sql instances list | grep demo | awk '{print \$1}'", returnStdout: true).trim()
                    sh label: '', script: "kubectl delete secret sql-instance --ignore-not-found"
                    sh label: '', script: "kubectl create secret generic sql-instance --from-literal=instanceName='$INSTANCE_NAME' --from-literal=connectionName=epam-demo-325303:us-central1:'$INSTANCE_NAME'"
                }
                withCredentials([file(credentialsId: 'gke-sa', variable: 'GKE_SA')]){
                    sh '''
                        kubectl apply -f secret.yaml
                        kubectl delete secret sql-credentials --ignore-not-found
                        kubectl create secret generic sql-credentials --from-file=credentials.json=/mnt/c/credentials.json
                    '''
                }
            }
        }
        
        stage('Deploy Ghost K8s'){
            steps{
                sh '''
                    kubectl apply -f ghost.yaml
                    kubectl apply -f ghost-svc.yaml
                '''
            }
        }
        stage('Deploy Cloud-Proxy K8s'){
            steps{
                sh '''
                    kubectl apply -f cloudsql_proxy.yaml
                    kubectl apply -f cloudsql_svc.yaml
                '''
            }
        }
        stage('Deploy Cloud Cronjob K8s'){
            steps{
                sh '''
                    kubectl apply -f cloud_cronjob.yaml
                '''
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}
