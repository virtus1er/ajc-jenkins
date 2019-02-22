node {
    stage('Checkout'){
        git branch: 'develop', url: 'https://github.com/virtus1er/ajc-jenkins.git'  
    }    
    stage('build'){
        withMaven( maven: 'mav', jdk: 'jdk8' ){
            sh "mvn clean verify"
        }
        step([$class: 'JUnitResultArchiver', testResults: 'target/surefire-reports/*.xml'])
        step([$class: 'JUnitResultArchiver', testResults: 'target/failsafe-reports/*.xml'])
    
        dir('target'){
            archive '*.jar'
        }
        stash name : 'binary', includes : 'target/*.jar'
    }
    stage('Deploy'){
        sh 'docker build -t app_jenkins .'
        sh 'docker run -d -p 8090:8080 app_jenkins'
    }
}
