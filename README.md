* 		Generate SSH Key Pair:
    * On the machine where you run the Jenkins job, generate an SSH key pair using the ssh-keygen command.
    * Make sure to leave the passphrase empty for automated scripts.
* 		bash  Copy codessh-keygen -t rsa -b 2048   
* 		Copy the Public Key to the Remote Server:
    * Copy the public key to the ~/.ssh/authorized_keys file on the target machine.
* 		bash  Copy codessh-copy-id -i ~/.ssh/id_rsa.pub user@10.202.5.114    Replace user with your actual username on the remote machine.
* 		Test SSH Connection:
    * Ensure that you can now SSH to the remote machine without entering a password.
* 		bash  Copy codessh user@10.202.5.114    This should log you in without prompting for a password.
* 		Modify Jenkins Job:
    * In the Jenkins job configuration, use the Jenkins Credential feature to manage the SSH private key.
    * Create a new Jenkins Credential of type "Secret File" and upload the private key generated in step 1.
    * In your Jenkins job, use the SSH private key credential in the SSH build step.
