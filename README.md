# openshift-applier-iaas
OpenShift Applier IaaS
## PRE_REQ:
Run ```./create_applier.sh $applier_name```

## STEPS
### 1. Project templates
Get project creation template into ```templates/project/projectrequest.yml```

### 2. App templates
Get application creation template into ```templates/app/app.yml```

### 3. Configuration Items
Get appliable configuration into ```configs/{sa,cm,secret,route}/$object_name.yml```

### 4. Group_vars
Add all objects into ```inventory/group_vars/all.yml```

### 5. Ansible hosts
Ensure below content in ```inventory/hosts```:
```
[seed-hosts]
localhost ansible_connection=local
```

### 6. Execute apply.yml:
```
ansible-playbook -i inventory/ apply.yml 
```

