Dev environment 

create a file in environment root call
account_vars.yaml
```
account_name: <accountname>
account_number: <54354543534543>
tfstate_bucket: <accountname>-tfstate 
```


from dev root folder run to see all resources in dev 
`aws-profile -p <target env> terragrunt run-all plan`



