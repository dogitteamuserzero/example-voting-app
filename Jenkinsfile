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
          ansiblePlaybook(
            playbook: 'ansible/site.yml',
            inventory: INVENTORY_PATH_PROD,
            credentialsId: ANSIBLE_CRED_ID,
            vaultCredentialsId: ANSIBLE_VAULT_CRED_ID,
            disableHostKeyChecking: true,
            extraVars: [
              nexusip: NEXUS_IP,
              nexusport: NEXUS_PORT,
              reponame: NEXUS_REPOSITORY,
              groupid: NEXUS_GROUP,
              vprofile_version: VERSION,
              artifactId: ARTIFACT_ID
            ])
    }
}
}
