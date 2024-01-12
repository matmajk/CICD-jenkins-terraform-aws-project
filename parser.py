import ast

with open("terraform/output.txt", "r") as f:
    file_content = f.read()
    exec(file_content)

terraform_instance = []

for dns in aws_public_instance_dns:
    terraform_instance.append("ansible_host=" + dns)

with open("ansible/hosts", "w") as f:
    f.writelines("# hosts\n\n")
    f.writelines("[instances]\n")
    for i in range(len(terraform_instance)):
        f.writelines("terraform_instance" + str(i) + " " + terraform_instance[i] + "\n")