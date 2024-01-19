locals {
    subnet_cidr_blocks = {
        for i in range(var.subnet_count): tostring(i) => cidrsubnet(var.cidr_block,
            0, i)
    }
    
}
