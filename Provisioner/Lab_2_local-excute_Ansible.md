## Local excute with playbook excution..
#### Must follow Lab_1 > 

#### create first
- ansible.yml
- ansible.cfg
- ansible.log
- ssh-keygen
#### ansible.yml
```- hosts: all
  tasks:
    - name: Execute The Command in remote shell module
      shell: "echo 'welcome tto usa' > /tmp/cloudknow"
```

#### ansible.cfg
```
[defaults]
remote_user = ec2-user
host_key_checking = False
```

```
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAY7QBUMCXVFJZAYEC"
  secret_key = "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"
}
resource "aws_key_pair" "devloper" {
  key_name    = "devloper"
  public_key  = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDcyScoGy8VgdJSBwG2z4b/r66inIIZdMferXR4ZE+q2skugKkwILbKDJ1lJMx9kGMYlN7b+520CqtL1s9K5faO7OFXdqUuCHonhZAXLdc4LzUgvUeY9GuN5G/AjbHAeDHnXHDNUg5EKiYSS0dCfKGSFIj/budzKqIfaNE9t0RwfuFS5Y3p3WxlWI3N4kVmojc/SIjK9cCBPGcBtIiBAWt+vNy5QsfgAd3sogm8AvcOX7K7Z1AEJMDyn0I83eGMnWYgPsoNmxeYUIogKnmom775KqGJH2pmJKXjgPM0zdMPbc0e7dJyHx+yqypRZhXvRqZ0Y0jZnUB8EQnpzOhD/InP root@ip-172-31-83-46.ec2.internal"
}



