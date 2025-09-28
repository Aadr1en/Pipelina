pipeline {
agent any
environment {
DOCKERHUB = 'adren493/simple-app'
TAG = "${env.BUILD_ID}"
}
stages {
stage('Checkout') {
steps { checkout scm }
}
stage('Build image') {
steps {
sh 'docker build -t $DOCKERHUB:$TAG app/'
}
}
stage('Login & Push') {
steps {
withCredentials([usernamePassword(credentialsId: 'jenkis', usernameVariable: 'adren493', passwordVariable: 'Adrienanders@1')]) {
sh 'echo $DH_PASS | docker login -u $adren493 --password-stdin'
sh 'docker push $DOCKERHUB:$TAG'
sh "docker tag $DOCKERHUB:$TAG $DOCKERHUB:latest || true"
sh 'docker push $DOCKERHUB:latest'
}
}
}
stage('Trigger CD (Ansible)') {
steps {
// Option 1: Jenkins exécute Ansible si Ansible/kubectl installé dans l'agent
sh 'ansible-playbook ansible/deploy.yml -i ansible/inventory --extra-vars "image=$DOCKERHUB:$TAG"'


// Option 2: Si vous préférez, appelez un webhook ou laissez Ansible être exécuté depuis un autre contrôle node
}
}
}
}