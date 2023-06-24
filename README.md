# Custom Operating System images based on Fedora

[![build](https://github.com/philipfalkner/fedora/actions/workflows/build.yml/badge.svg)](https://github.com/philipfalkner/fedora/actions/workflows/build.yml)

This is my customized container images using Fedora's [support for OCI containers as a transport and delivery mechanism for operating system content](https://fedoraproject.org/wiki/Changes/OstreeNativeContainerStable).

## Features

- Start with a Fedora image
- Sets automatic staging of updates for the system
- Sets flatpaks to update twice a day

## How to Install

To rebase an existing Silverblue/Kinoite machine to the latest release:

**Kinoite (KDE)**

    sudo rpm-ostree rebase ostree-unverified-registry:ghcr.io/philipfalkner/fedora-kinoite:39

## Verification

These images are signed with sigstore's [cosign](https://docs.sigstore.dev/cosign/overview/). You can verify the signature by downloading the `cosign.pub` key from this repo and running the following command:

    cosign verify --key cosign.pub ghcr.io/philipfalkner/fedora-kinoite

If you're forking this repo you should [read the docs](https://docs.github.com/en/actions/security-guides/encrypted-secrets) on keeping secrets in github. You need to [generate a new keypair](https://docs.sigstore.dev/cosign/overview/) with cosign. The public key can be in your public repo (your users need it to check the signatures), and you can paste the private key in Settings -> Secrets -> Actions.
