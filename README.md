# Tekton Pipeline for Building Fedora RPMs

This is the **Fedora flavor** of the Tekton RPM Build Pipeline, which allows you
to easily build [Fedora packages][] in [Fedora Konflux][].

The main difference compared to the [upstream flavor][] is that the Fedora
flavor builds against Fedora "buildroots" (RPM package repositories hosted by
the official [Fedora Koji][] build system).

Ready to build?  [Onboard](docs/onboarding.md) your packages!


## How it works

In short, based on the provided [parameters](docs/parameters.md), the pipeline
retrieves RPM package source code from a [DistGit][]-like repository, obtains
Mock configuration from Fedora Koji, and builds RPMs using [Mock][].  The
pipeline allocates architecture-specific workers to run *Mock* builds in the
appropriate environments (`aarch64` and `x86_64`, given the current
[infrastructure limitations] of [Fedora Konflux][fedora konflux docs]).

Except for a few differences (see the [diff-flavor.sh](diff-flavor.sh) script),
this flavor works in principle similarly to the [upstream flavor][], so please
refer to the upstream documentation.


## Help the project

We'd love your feedback and contributions. Please open issues, or
[contribute](CONTRIBUTING.md)!

[Konflux]: https://konflux-ci.dev/docs/getting-started/
[Fedora packages]: https://src.fedoraproject.org/projects/rpms/%2A
[Fedora Konflux]: https://konflux.fedoraproject.org/application-pipeline
[upstream flavor]: https://github.com/konflux-ci/rpmbuild-pipeline/blob/main/README.md
[Mock]: https://rpm-software-management.github.io/mock/
[DistGit]: https://github.com/release-engineering/dist-git
[Fedora Koji]: https://koji.fedoraproject.org/
[infrastructure limitations]: https://gitlab.com/fedora/infrastructure/konflux/infra-deployments/-/issues/9
[fedora konflux docs]: https://github.com/konflux-ci/community/blob/main/sigs/fedora/cluster.md
