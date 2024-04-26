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
    steps {
          ansiblePlaybook playbook: 'ansible/votingapp-deploy-from-nexus.yml', inventory: 'ansible/site.yml', credentialsId: ANSIBLE_CRED_ID, hostKeyChecking: false,
            extraVars: [
              nexusip: NEXUS_IP,
              nexusport: NEXUS_PORT,
              reponame: NEXUS_REPOSITORY,
              groupid: NEXUS_GROUP,
              vprofile_version: VERSION,
              artifactId: ARTIFACT_ID
            ]
    }
}
}
