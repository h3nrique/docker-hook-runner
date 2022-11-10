FROM quay.io/openshift/origin-cli:4.11 as cli

FROM quay.io/ansible/ansible-runner:stable-2.12-latest
COPY --from=cli /usr/bin/oc /usr/bin/oc
RUN pip3 install kubernetes openshift jmespath
RUN ansible-galaxy collection install kubernetes.core
RUN ansible-galaxy collection install community.general
RUN chmod 777 /home/runner/.ansible && chmod 777 /home/runner/.ansible/tmp
RUN mkdir /.ansible && chmod 777 /.ansible
USER 65534:65534
