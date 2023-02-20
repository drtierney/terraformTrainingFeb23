output "vm1-ip" {
  value = aws_instance.vm[0].private_ip
}

output "all_vm_names_ips" {
  value = [for vm in aws_instance.vm : "${vm.tags.Name} has the private IP ${vm.private_ip}"]
}
