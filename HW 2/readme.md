# Stepan Romanchuk HW No.2 !
In the second homework we were tasked to create a particular Azure cloud 
architecture. 
- We need to create two VMs host some kind of web server on them, and load balance them using Azure load balancer.
Here is the diagram of what we need to build.
![Home Work diagram](https://github.com/Odery/GlobalLogicDevOpsBootCampv2/blob/main/HW%202/HWtask.png?raw=true)

- Then we need to Export resulting infrastructure as an **ARM** template and commit to your repository. 
- And lastly, for the **extra points**, Web-server installation should be handled by template

**Execution of the Home Work:**

- Firstly, I created a resource group in Azure portal, then I created two VMs running Debian 11 Bullseye (*Debian is the Linux flavor that I really like*). 
- After that I added and configured the Load balancer itself to serve data from
these VMs.

Here is resulting diagram:
![Azure Diagram](https://github.com/Odery/GlobalLogicDevOpsBootCampv2/blob/main/HW%202/AzureLBDiagram.png?raw=true)

As we can see, the load balancer balances load between two VMs, so when one is 
overloaded or dead, the other one will still accept traffic to 80 port in our example. 

- Then we need to deploy a web server to our VMs, for extra points this step needs to be done automatically via some kind of deployment script.
We can find a lot information regarding that in Microsoft resource:
[Use infrastructure automation tools with virtual machines in Azure](https://learn.microsoft.com/en-us/azure/virtual-machines/infrastructure-automation) 
In this resource we can find all necessary information that we need to do on this step.
So firstly, we need to write a bash script that will install Nginx web server for us:
```bash
#!/bin/bash
 
# update package source
apt-get -y update
  
# install NGINX
apt-get -y install nginx
  
# change default site a little
cat > /var/www/html/index.nginx-debian.html <<  EOL

<!DOCTYPE html><html><head><title>Welcome to nginx!</title><style>

body {width: 35em;margin: 0 auto;font-family: Tahoma, Verdana, Arial, sans-serif;}

</style></head><body><h1>Stepan Romanchuk HW2</h1><p>GL Home Work No.2.</p>

EOL
```
- After that, we just need to add the script to Azure storage, and add **Custom Script** extension to each VM. Run it, and now we have two web servers running Nginx on Debian 11, with custom *index.html* file.
- So, lastly, we need to open *Load Balancer* **IP** address, in our explorer, and as we can see, everything works like indented.
-![Result screenshot of the browser](https://github.com/Odery/GlobalLogicDevOpsBootCampv2/blob/main/HW%202/Result.png?raw=true)

- And the last task is to just export entire resulting infrastructure.
You can see the exported Json files in this *repository*.
