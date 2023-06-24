ARG SOURCE_IMAGE="${SOURCE_IMAGE:-fedora-kinoite}"
ARG BASE_IMAGE="quay.io/fedora/${SOURCE_IMAGE}"
ARG FEDORA_MAJOR_VERSION=${FEDORA_MAJOR_VERSION:-39}

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

# Install configurations from https://github.com/ublue-os/config
COPY --from=ghcr.io/ublue-os/config:latest /rpms/ /tmp/rpms
RUN rpm-ostree install \
  /tmp/rpms/ublue-os-udev-rules.noarch.rpm \
  /tmp/rpms/ublue-os-update-services.noarch.rpm
RUN rm -rf /tmp/rpms

RUN ostree container commit
