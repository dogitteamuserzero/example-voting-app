node {
  
  stage('SCM') {
    checkout scm
  }
  stage('SonarQube Analysis') {
    def scannerHome = tool 'Sonar4Class';
    withSonarQubeEnv() {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }

  stage('Deploy to Env'){
          ansiblePlaybook playbook: 'ansible/votingapp-deploy-from-nexus.yml', inventory: 'ansible/site.yml', credentialsId: 'vagrantssh', hostKeyChecking: false,
            extraVars: [
              nexusip: '192.168.3.96',
              nexusport: '8083',
              reponame: 'eva-docker-release',
              version: "${env.BUILD_TIMESTAMP}-${env.BUILD_ID}"
            ]
  }
}
