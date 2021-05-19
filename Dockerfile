FROM quay.io/openshift/origin-cli:4.7 as cli

FROM docker.io/ansible/ansible-runner:latest
COPY --from=cli /usr/bin/oc /usr/bin/oc
RUN yum -y update && yum -y install python3-kubernetes python3-openshift && yum clean all
