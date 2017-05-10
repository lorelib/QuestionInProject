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