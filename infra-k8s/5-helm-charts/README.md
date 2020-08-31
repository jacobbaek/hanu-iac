# This helm charts will be used as Management and Service CICD envinronment.

# How to deploy
These helm charts was deployed by helm version 3.
Below command was used when we deployed.
```
helm install [helm_name] -f values.yaml . -n [namespace]
```

If you use helm version 2, then you should run like below command.
```
helm install --name [helm_name] --namespace [namespace] -f values.yaml .
```

# Components 

### jenkins
> namespace: jenkins

### metallb

### nginx-ingress

### LDAP
> namespace: ldap
- openldap
  - admin password will check by kubectl get secret. (You can find command by 'helm get notes')
  - users, groups OU already included through ldif file template.
- phpldapadmin
  - https://github.com/cetic/helm-phpLDAPadmin
  - when it deployed, you can access with account that is on openldap.
  - phpldapadmin web ui can access by ingress address.
  - You can access by 'cn=admin,dc=hanu-ci,dc=io' with password
    And also can make user below users OU.

### minio
> namespace: minio
- minio
  this application will be used for management of JCaaC file.

### Logging and Monitoring
> namespace: lma
- fluent-bit
- elasticsearch
- kibana (Optional)
- prometheus-operator
- grafana
