resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
  tags       = local.vpc_tags
}

resource "aws_subnet" "web" {
  count             = length(var.web_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.web_subnet_cidr[count.index]
  tags              = local.web_subnet_tags
  availability_zone = var.azs[count.index]
}

resource "aws_subnet" "app" {
  count             = length(var.app_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.app_subnet_cidr[count.index]
  tags              = local.app_subnet_tags
  availability_zone = var.azs[count.index]

}

resource "aws_subnet" "db" {
  count             = length(var.db_subnet_cidr)
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.db_subnet_cidr[count.index]
  tags              = local.db_subnet_tags
  availability_zone = var.azs[count.index]

}

