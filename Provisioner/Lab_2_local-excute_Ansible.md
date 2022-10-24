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
  public_key  = ""
}



