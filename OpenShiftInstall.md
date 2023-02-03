# About these instructions


```s bash
oc new-app "https://github.com/kuhlaid/datahub.git" \
--name datahub-test
```

`oc delete all --selector app=datahub-test`

Trying to create an OpenShift application using YAML

```
apiVersion: build.openshift.io/v1
kind: BuildConfig
metadata:
  name: datahub-test
  labels:
    app: datahub-test
spec:
  source:
    type: Git
    git:
      uri: https://github.com/kuhlaid/datahub.git
    contextDir: datahub
  strategy:
    type: Docker                      
    dockerStrategy:
      dockerfilePath: Dockerfile    # Look for Dockerfile in: gitUri/contextDir/dockerfilePath
  output:
    to:
      kind: ImageStreamTag
      name: datahub-test:latest
```