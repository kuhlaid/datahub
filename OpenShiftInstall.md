# About these instructions


```s bash
oc new-app "https://github.com/kuhlaid/datahub.git" \
--name datahub-test
```

`oc delete all --selector app=datahub-test`