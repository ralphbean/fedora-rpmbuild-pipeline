# RPM Build Pipeline Parameters (Fedora)

Below is the set of supported parameters accepted by the pipeline.

| name          | description | default value |
| ---           | ----        | ---           |
| ociStorage    | OCI registry URL where the pipeline stores results. | `quay.io/konflux-fedora/$(context.taskRun.namespace)/$(params.package-name):$(params.revision)` |
| package-name  | The name of the package being built. | |
| git-url       | Source Repository URL. Typically set to `{{ source_url }}` Go template. | |
| revision      | Revision of the Source Repository. Typically use `{{ revision }}`. | |
| target-branch | What is the package git repo branch we work with, e.g., `f42`, `rawhide`, ... | |
| build-architectures | Array of architectures we want to build for. | `[aarch64, x86_64]` |
| hermetic      | Perform the RPM build in a hermetic (offline) environment. | true |
| script-environment-image | OCI Container image used as an environment for multiple scripts in the Pipeline, provides, e.g., the [Mock][] command, [koji][] client, [dist-git][] client, etc.  | Check the value [in code][default].  Updated from time to time to the latest image version built by GitOps from [the container main branch][mock-image]. |


## Parametrizing timeouts

There is a default [PipelineRun timeout][] for each Konflux instance (typically
2 hours).  You can extend/shorten it if needed.  The underlying rpmbuild tasks
are not a limiting factor, as they time out after 72 hours.


## Test-only parameters

These arguments are NOT meant to be used by end-users.  We use them internally
by the pipeline's CI.

| name                    | used in tasks |
| ---                     | ---           |
| self-ref-url            | get-rpm-sources, rpmbuild, upload-sbom |
| self-ref-revision       | get-rpm-sources, rpmbuild, upload-sbom |
| test-suffix             | import-to-quay |
| ociArtifactExpiresAfter | clone-repository, get-rpm-sources, calculate-deps, rpmbuild|


[PipelineRun timeout]: https://tekton.dev/docs/pipelines/pipelineruns/#configuring-a-failure-timeout
[mock-image]: https://gitlab.com/fedora/infrastructure/konflux/rpmbuild-pipeline-environment-container
[Mock]: https://rpm-software-management.github.io/mock/
[koji]: https://docs.pagure.org/koji/
[dist-git]: https://github.com/release-engineering/dist-git
[default]: https://gitlab.com/fedora/infrastructure/konflux/rpmbuild-pipeline/blob/main/pipeline/build-rpm-package.yaml
