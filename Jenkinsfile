node {
stage('download') {
   git branch: 'Development', url: 'https://github.com/vyom-Labs-pvt-ltd/DevOps.git'
   
}
stage('build') {
   sh 'mvn package'
}
stage('deploy') {
   deploy adapters: [tomcat9(credentialsId: 'tomcatusers', path: '', url: 'http://172.31.23.215:8080')], contextPath: 'aws', war: '**/*.war'
}
}
