FROM registry.access.redhat.com/openshift3/logging-fluentd:3.4.0

ADD redis-plugin/ ${HOME}/
WORKDIR ${HOME}
RUN fluent-gem install 0.2.3/redis-3.3.0.gem --local && \
    fluent-gem install 0.2.3/fluent-plugin-redis-0.2.3.gem --local

ADD run.sh  ${HOME}/

USER 0
CMD ["sh", "run.sh"]
