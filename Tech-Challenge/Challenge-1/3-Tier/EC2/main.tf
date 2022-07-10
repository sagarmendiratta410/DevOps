
resource "aws_instance" "challenge_machine" {
ami = "ami-08d4ac5b634553e16"
for_each =  {
  key1 = "t2.micro"
  key2 = "t3.micro"
   }
instance_type = each.value
key_name = each.key
tags = {
  Name = each.value
  }
}

resource "aws_key_pair" "deployer" {     
  key_name   = "deployer-key"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}


resource "aws_instance" "resource2" {
  ami = "ami-08d4ac5b634553e16"
  key_name = aws_key_pair.deployer.key_name
  instance_type = "t2.micro"
  provisioner "local-exec" {
     command = "echo ${aws_instance.resource2.private_ip}"
	 on_failure = continue
  }
  provisioner "remote-exec" {
    connection {
	type        = "ssh"
    user        = "ubuntu"
    host        = aws_instance.resource2.public_ip    
    private_key = "${file("~/.ssh/id_rsa")}"
    timeout     = "300s"
	agent       = false
	}
    inline = [
	  "sudo apt-get update -y ",
      "sudo apt install -y nginx",
	  "curl http://169.254.169.254/latest/meta-data/local-hostname",
	  "curl http://169.254.169.254/latest/meta-data/instance-id"
    ]
 }
}












