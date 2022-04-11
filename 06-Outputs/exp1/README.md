```
  341  terraform plan 
  342  vim uat.tfvars
  343  terraform plan 
  344  terraform plan -var-file=uat.tfvars 
  345  ls
  346  cp -rf uat.tfvars prod.tfvars
  347  ls
  348  vim prod.tfvars 
  349  terraform plan -var-file=uat.tfvars 
  350  terraform plan -var-file=prod.tfvars 
```
