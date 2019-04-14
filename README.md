# Contest
## How to run the contest
You need to pass 2 variables to container, OC_URL which suppose to point to your openshift cluster and OC_TOKEN which is actually password to access your Openshift environment.
Example:
```
docker run -e OC_URL=https://api.starter-us-east-1.openshift.com \
  -e OC_TOKEN=qNmldCM_YHr3FDmjliuhzmyadGE30kTpQq12121 \
  -e OC_PROJECT=fixit{1..6} \
  -v `pwd`:/home/contest/volume \
  -it anikiforova/fixit



Inside the container (helper commands)
```
oc login $OC_URL --token=$OC_TOKEN
```
## Troubleshoot code in container
```
docker run --entrypoint bash -it anikiforova/fixit:v0.1
```

## Tasks

There is a magic piece of code inside "the_task".

To run this code use "pytest" and the name of the file.

Fix the magic and submit the answer.
