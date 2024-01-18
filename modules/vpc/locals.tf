locals {
    public_subnet_cidr_blocks = {
        for i in range(var.subnet_count): tostring(i) => cidrsubnet(var.cidr_block,
            var.subnet_length, i)
    }
    private_subnet_cidr_blocks = {
        for i in range(var.subnet_count): tostring(i) => cidrsubnet(var.cidr_block,
            var.subnet_length, i)
    }
}
