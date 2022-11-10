# terraform adventures

 Provision a fully set-up Wordpress blog with database and web server on AWS EC2 instances using Terraform

 INSTRUCTIONS:

 Download the files in this repository to a working folder locally.

 To start the servers you will need to make the following changes:

  - Change the details marked in the comments in the following files: 

            - wp-server.tf
            - sql-server.tf
            - secgroups.tf
            - scripts/add-wp.yaml - change the following value in line 48 to your secret API key YOUR_KEY_ID_GOES_HERE
            - scripts/add-wp.yaml - change the following value in line 49 to your secret API key YOUR_SECRET_KEY_GOES_HERE
            - scripts/add-wp.yaml - change the following value in line 53 to your server name that you gave in the tags of sql-server.tf "Values=Isti_MySQL"
            

  - Copy your private key (.pem format) into the folder

  - Open a terminal, install terraform if not yet present

  - Navigate into the folder containing the .tf files and type the following:

        To initiate Terraform:

            - terraform init

        To validate your configuration files:

            - terraform validate

        To apply changes and provision the servers:

            - terraform apply

 You can check the server status on your AWS EC2 dashboard.
 The wordpress site should be available when the server configuration is finished.
 
 IMPORTANT: HTTPS is not available in this version, so make sure to open your blog using a http:// address.

 Enjoy!

