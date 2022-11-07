module my_ec2 {
    #source = "../../modules/templates/instances"
    source = "../../modules/resources/asg"
    Name = "meu_ec2"
}