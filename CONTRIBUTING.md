# Contribution Guidelines

The **RPM Build Pipeline** is open source — see our [license](COPYING).
**Contributions are welcome!**

This project hosts the Fedora flavor of the pipeline.
Please note that an [upstream flavor][] exists, along with other variants
(e.g., RHEL (Red Hat private), CentOS (soon), and possibly more).

Much of the Pipeline code is the same or very similar across these flavors.  To
keep maintenance sustainable, please follow the [upstream first][] principle: if
your change could reasonably belong [upstream][upstream flavor], propose it
there first.  Once it's accepted, you can then adapt it for (sync with) the
Fedora pipeline.

If you believe your change is Fedora-specific, please reconsider whether it is
truly necessary.  Ideally, open an issue for discussion.  Diverging from
upstream increases maintenance costs.


## Merge Request Guidelines

Whenever a merge request is opened or updated in this repository, a sample RPM
package is built to verify that nothing breaks after (potentially) merging.

**Please make sure the CI stays green!**


## Code Organization & Style

Here are some important notes:

- Tasks that are reusable by other Pipelines should live in the
  [build-definitions repo][].  Tasks that are specific to this pipeline belong
  in the [/task](task) directory.
- The pipeline definition is in
  [`pipeline/build-rpm-package.yaml`](pipeline/build-rpm-package.yaml).
- YAML files use **2-space indentation**, including for dictionary values.
- This project uses external Tasks/Bundles → please keep the YAML formatting
  compatible with the [Renovate][] bot.

[Renovate]: https://github.com/renovatebot/renovate
[upstream first]: https://docs.fedoraproject.org/en-US/project/upstream-first/#upstream-why
[upstream flavor]: https://github.com/konflux-ci/rpmbuild-pipeline
