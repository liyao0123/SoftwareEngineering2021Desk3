Git and Docker are needed to deploy this application.

#### It takes 4 steps:
1. git clone this project to linux file system   
  `git clone https://github.com/liyao0123/SoftwareEngineering2021Desk3.git`
2. change directory into the application folder   
  `cd SoftwareEngineering2021Desk3/application`
3. modify the variables defined in env.env, or leave it as it is if you just want to test this application locally.   
   If you want to deploy this project with a remote server, you need to do two things.   
   1)change the host in env.env file as your own server ip   
   2)add a security group rule and open the 3000 port so that you could load our dynamic earth.
4. run bash build.sh   
  `./build.sh`

It may take 3 or 4 minutes unitl the application up.
The procedures have been tested both in Win10 and Centos.
More details about the deployment procedures can be found in [DeploymentDetail.md](/application/DeploymentDetail.md)
