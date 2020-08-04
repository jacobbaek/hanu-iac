# This helm charts will be used as Management and Service CICD envinronment.

# How to deploy
These helm charts was deployed by helm version 3.
Below command was used when we deployed.
```
helm install [helm_name] -f values.yaml . -n [namespace]
```

# Components 

### jenkins

### metallb

### nginx-ingress

### vault
- vault

### LDAP
- openldap
  - admin password will check by kubectl get secret. (You can find command by 'helm get notes')
- phpldapadmin
  - https://github.com/cetic/helm-phpLDAPadmin
  - when it deployed, you can access with account that is on openldap.
