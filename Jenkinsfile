pipeline {
    agent any
    
    stages {
        stage('Storage Status') {
            steps {
                echo 'Информация о доступном пространстве на дисках:'
                sh '''
                    # Проверка состояния дисков
                    df -h
                '''
            }
        }
        
        stage('Memory Usage Analysis') {
            steps {
                echo 'Определение процесса с максимальным потреблением памяти:'
                script {
                    sh '''
                        ps -eo pid,comm,%mem --sort=-%mem | head -2
                    '''
                }
            }
        }
    }
    
    post {
        always {
            echo 'Диагностика системы завершена'
        }
    }
}
