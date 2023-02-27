module "fullstack" {
    source = "./modules/fullstack"

    prefix = "dt"
    cidr_block = "10.25.0.0/20"
    subnet_count = 2
    vm_count_per_subnet = 2
}
