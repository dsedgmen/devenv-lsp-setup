# COPR make_srpm — bake Version/Release into shipped spec (.ONESHELL).
SHELL := /bin/bash
.ONESHELL:
.PHONY: srpm

srpm:
	set -euo pipefail
	dnf -y install git rpm-build rpmdevtools 2>/dev/null || \
	  yum -y install git rpm-build rpmdevtools 2>/dev/null || true
	chmod +x ./scripts/rpm-version.sh
	eval "$$(./scripts/rpm-version.sh --shell)"
	if [[ -z "$${VERSION}" || -z "$${RELEASE}" ]]; then
	  echo "rpm-version.sh produced empty VERSION/RELEASE" >&2
	  exit 1
	fi
	if [[ "$${RELEASE}" == "1" && "$${CHANNEL}" != "stable" ]]; then
	  echo "Refusing non-stable Release=1 (channel=$${CHANNEL})" >&2
	  exit 1
	fi
	echo "channel=$${CHANNEL} version=$${VERSION} release=$${RELEASE}"
	qmark='?'
	dist_suffix="%{$${qmark}dist}"
	SPEC_BUILT=/tmp/devenv-lsp-setup-built.spec
	sed \
	  -e "s/^Version:.*/Version:        $${VERSION}/" \
	  -e "s/^Release:.*/Release:        $${RELEASE}$${dist_suffix}/" \
	  devenv-lsp-setup.spec > "$${SPEC_BUILT}"
	grep -E '^(Version|Release):' "$${SPEC_BUILT}"
	mkdir -p "$(outdir)"
	rm -rf /tmp/devenv-lsp-setup-pack
	mkdir -p "/tmp/devenv-lsp-setup-pack/devenv-lsp-setup-$${VERSION}"
	cp -a lsp-config.lua treesitter-config.lua plugins-config.lua \
	  vim-ale-config.vim README.md LICENSE \
	  "/tmp/devenv-lsp-setup-pack/devenv-lsp-setup-$${VERSION}/"
	cp "$${SPEC_BUILT}" "/tmp/devenv-lsp-setup-pack/devenv-lsp-setup-$${VERSION}/devenv-lsp-setup.spec"
	tar -C /tmp/devenv-lsp-setup-pack -czf "/tmp/devenv-lsp-setup-$${VERSION}.tar.gz" \
	  "devenv-lsp-setup-$${VERSION}"
	rm -rf /tmp/devenv-lsp-setup-rpmbuild
	mkdir -p /tmp/devenv-lsp-setup-rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS}
	rpmbuild -bs "$${SPEC_BUILT}" \
	  --define "_topdir /tmp/devenv-lsp-setup-rpmbuild" \
	  --define "_sourcedir /tmp" \
	  --define "_srcrpmdir $(outdir)"
	echo "Built SRPM channel=$${CHANNEL} $${VERSION}-$${RELEASE}"
	ls -la "$(outdir)"/devenv-lsp-setup-*.src.rpm
