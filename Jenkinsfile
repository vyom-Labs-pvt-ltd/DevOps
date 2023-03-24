node { 
    

    stage('Continuous Download') {
        
            git branch: 'Development', url: 'https://github.com/vyom-Labs-pvt-ltd/DevOps.git'
         
        }
    stage('Continuous Build') {
    
    def mavenHome= tool name: "Maven" ,type: "maven"
        sh "${mavenHome}/bin/mvn clean package"
		}


    stage('Build Docker Image') {

        sh 'docker build -t project . '
         
        }
    stage('Login & Push Image to Dockerhub ') {
        
	   withCredentials([string(credentialsId: 'DockerHub', variable: 'DockerPass')]) {
         sh 'docker login -u imruturaj -p ${DockerPass}'
		 sh 'docker tag project imruturaj/project1'
		 sh 'docker push imruturaj/project1'
            
        }
    }
   
	stage('Continuous Delivery (Test Server)') {
		
		sshagent(['sshagent']) {
		withCredentials([string(credentialsId: 'DockerHub', variable: 'DockerPass')]) {
		sh 'ssh ec2-user@172.31.24.112 sudo docker login -u imruturaj -p ${DockerPass}'
		sh 'ssh ec2-user@172.31.24.112 sudo docker rm -f $(docker ps -aq)'
		sh 'ssh ec2-user@172.31.24.112 sudo docker run -p 8080:8080 -d --name myapp-container imruturaj/project1'
}
}
	
	
	}
}
