```
  324  cd exp2/
  325  ls
  326  cat variable.tf 
  327  TF_VAR_my_rg_name="Amit-Test-RG" terraform plan 
  328  TF_VAR_my_rg_name="Amit-Test-RG" TF_VAR_my_loc="westus" terraform plan 
  329  TF_VAR_my_rg_name="Amit-Test-RG" TF_VAR_my_loc="westus" terraform plan -out build-plan 
```
