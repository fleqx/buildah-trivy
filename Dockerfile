FROM fedora:34

# renovate: datasource=repology depName=fedora_34/buildah
ENV BUILDAH_VERSION="1.21.0"

RUN dnf install -y buildah-${BUILDAH_VERSION} \
  	&& dnf clean all \
  	&& rm -rf /var/cache/dnf

ENV STORAGE_DRIVER=vfs

# renovate: datasource=github-releases depName=aquasecurity/trivy
ENV TRIVY_VERSION="0.18.2"

RUN rpm -ivh https://github.com/aquasecurity/trivy/releases/download/v${TRIVY_VERSION}/trivy_${TRIVY_VERSION}_Linux-64bit.rpm

