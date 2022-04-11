```
65  cd 02-Terraform-CLI/
   66  ls
   67  cp -rf ../01-First-Deployment/main.tf . 
   68  ls
   69  terraform init 
   70  ls
   71  ls -a 
   72  ls -R .terraform
   73  ls
   74  terraform validate 
   75  ls
   76  vim main.tf 
   77  terraform validate 
   78  vim main.tf 
   79  terraform validate 
   80  ls
   81  vim main.tf 
   82  terraform validate 
   83  vim main.tf 
   84  terraform validate 
   85  vim main.tf 
   86  terraform fmt 
   87  cat main.tf 
   88  terraform plan 
   89  terraform apply 
   90  terraform plan -out bulid-plan
   91  ls
   92  cat bulid-plan 
   93  terraform show bulid-plan 
   94  terraform apply  bulid-plan 
   95  terraform plan -destroy -out destroy-plan
   96  terraform show destroy-plan 
   97  terraform apply destroy-plan 
   98  terraform show 
   99  terraform apply 
  100  terraform apply --auto-approve 
  101  terraform show 
  102  terraform destroy --auto-approve
```
