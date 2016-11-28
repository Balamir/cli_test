node {
    currentStatus = "BASARILI"
    try {
        stage("Checkout Basladi") {
            // Repo'dan kodu al
            checkout scm
            echo "Checkout Bitti"
        }
        stage("Test Basladi") {
            sh "java -Dsbt.log.noformat=true -jar /var/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt_default/bin/sbt-launch.jar test"
            echo "Test Bitti"
        }
        stage("Derleme Basladi"){
            sh "java -Dsbt.log.noformat=true -jar /var/jenkins_home/tools/org.jvnet.hudson.plugins.SbtPluginBuilder_SbtInstallation/sbt_default/bin/sbt-launch.jar assembly"
            echo "Derleme bitti"
        }
    } catch ( err ) {
        currentStatus = "BASARISIZ"
        echo currentStatus
    }
}
