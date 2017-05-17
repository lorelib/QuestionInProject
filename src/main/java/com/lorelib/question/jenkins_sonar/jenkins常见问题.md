1.jenkins配置git报如下错误：

    Failed to connect to repository : Command "/usr/bin/git ls-remote -h git@ip:/home/git/repo/New_OptCenter.git HEAD" returned status code 128:
    stdout: 
    stderr: Permission denied, please try again. 
    Permission denied, please try again. 
    Permission denied (publickey,password,keyboard-interactive). 
    fatal: Could not read from remote repository.
    
    Please make sure you have the correct access rights
    and the repository exists.
    
解决方法：

    1.确定jenkins所在服务器安装了git;
    2.生产ssh key，并将公钥导入到目标git服务器；
    3.把当前用户生成的公钥、私钥复制到/var/lib/jenkins/.ssh目录；
    4.修改jenkins/.ssh的所属用户和用户组：sudo chown -R jenkins:jenkins /var/lib/jenkins/.ssh/   .
    
    
2.jenkins中集成sonar
在项目根目录加上sonar-project.properties怎么配置路径都有错误，不知道是不是我弄错了什么
较常见的错误是：
        Findbugs needs sources to be compiled. Please build project before executing sonar or check the location of compiled classes to make it possible for Findbugs to analyse your project.
        
反倒是在jenkins配置sonarqube scanner的Analysis properties属性：
    sonar.projectKey=com.lorelib.snowflake:Snowflake-Java
    sonar.projectName=Snowflake-Java
    sonar.projectVersion=1.0
    sonar.language=java
    sonar.sources=$WORKSPACE/src
    
执行成功了。