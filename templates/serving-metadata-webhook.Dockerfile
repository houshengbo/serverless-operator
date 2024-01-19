FROM registry.ci.openshift.org/openshift/release:golang-__GOLANG_VERSION__ AS builder

ENV BASE=github.com/openshift-knative/serverless-operator
WORKDIR ${GOPATH}/src/${BASE}

COPY . .

ENV GOFLAGS="-mod=vendor"
RUN go build -o /tmp/metadata-webhook ${BASE}/serving/metadata-webhook/cmd/webhook

FROM registry.access.redhat.com/ubi8/ubi-minimal
USER 65532

COPY --from=builder /tmp/metadata-webhook /ko-app/metadata-webhook

ENTRYPOINT ["/ko-app/metadata-webhook"]
