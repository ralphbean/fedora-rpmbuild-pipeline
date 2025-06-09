# How to build your Fedora RPM(s) in Fedora Konflux

There are a few integration steps you need to follow to enable RPM builds:

1. **Host your package sources in a compatible forge** (currently GitHub or
   GitLab).  For example, if you're working with a Fedora package (hosted on
   Pagure, which can not be integrated with Konflux), you'll need to create a
   fork in a supported forge.  [Here is example repository][example package].

2. **Enable the [GitHub Konflux application][gh app]** for your project.  For
   the GitLab forge, you need to [set repo secret ][gitlab integration].

3. **Create or get access to a Konflux tenant**.  There's a GitOps work-flow for
   this, see [example merge-request][new-tenant].

3. **Create an Application/Component** in the [Konflux UI][application-pipeline]
   for your package builds. Until we get the [onboarding flow] integrated, this
   will generate a pull request to your repo with a default container pipeline,
   which you can close and ignore.

4. **Add a `.tekton/` directory** to your Git project.  See [this pull
   request][example PR] for reference.
   You'll need to update the configuration according to your setup:
   - application/component names
   - package name
   - `quay.io` path where you want the pipeline to upload built artifacts
   - correct [parameters](parameters.md)

5. **Open a PR** with the new `.tekton/` directory → let CI complete
   successfully (green) → merge the PR → wait for the Tekton `push` pipeline run
   to finish the RPM build.

6. **Download the RPMs from Quay.io**: using [oras][oras] or [podman
   artifact][podman artifact].

    ```bash
    url="quay.io/konflux-fedora/your-tenant/your-component:d8e3fd281eaf19f54a091a7df9f7a3258c73f2a2.nvr-NVR"
    mkdir -p /tmp/results && cd /tmp/results && oras pull "$url"
    ```
**Happy building!**

[gh app]: https://github.com/apps/konflux-fedora
[application-pipeline]: https://konflux.fedoraproject.org/application-pipeline
[example package]: https://github.com/praiskup/example-fedora-konflux-libecpg
[example PR]: https://github.com/praiskup/example-fedora-konflux-libecpg/pull/2
[gitlab integration]: https://konflux-ci.dev/docs/building/creating-secrets/#creating-source-control-secrets
[onboarding flow]: https://gitlab.com/fedora/infrastructure/konflux/infra-deployments/-/issues/22
[oras]: https://oras.land
[podman artifact]: https://docs.podman.io/en/v5.4.0/markdown/podman-artifact.1.html
[new-tenant]: https://gitlab.com/fedora/infrastructure/konflux/tenants-config/-/merge_requests/31/diffs
