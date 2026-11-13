# Macros (CI / COPR / rpmbuild --define):
#   devenv_lsp_ver  — RPM Version
#   devenv_lsp_rel  — RPM Release without dist (%%{?dist} appended)
Name:           devenv-lsp-setup
Version:        %{?devenv_lsp_ver}%{!?devenv_lsp_ver:1.0.0}
Release:        %{?devenv_lsp_rel}%{!?devenv_lsp_rel:1}%{?dist}
Summary:        Shared LSP/Tree-sitter configs for the devenv stack

License:        MIT
URL:            https://github.com/dsedgmen/devenv-lsp-setup
Source0:        %{name}-%{version}.tar.gz

BuildArch:      noarch
BuildRequires:  coreutils

%description
Shared configuration files for Fedora system LSP servers and Tree-sitter
grammars. Install devenv-lsp-setup-neovim and/or devenv-lsp-setup-vim for
editor-specific integration.

Does not overwrite user ~/.vimrc or ~/.config/nvim/init.lua.

Versioning: main = beta; tags = stable/rc. See RELEASE.md.

%package -n devenv-lsp-setup-neovim
Summary:        Neovim LSP and Tree-sitter modules (devenv)
Requires:       %{name} = %{version}-%{release}
Requires:       neovim

%description -n devenv-lsp-setup-neovim
Installs lsp-config, treesitter-config, and plugins-config on the Neovim
packpath so soft-requires from devenv-ai-assistant resolve.

%package -n devenv-lsp-setup-vim
Summary:        Vim ALE/LSP config (devenv)
Requires:       %{name} = %{version}-%{release}
Requires:       vim-enhanced
Recommends:     vim-ale

%description -n devenv-lsp-setup-vim
Installs ALE/LSP keymaps into vimfiles plugin path
(%{_datadir}/vim/vimfiles/plugin/). Does not overwrite ~/.vimrc.

%prep
%autosetup -n %{name}-%{version}

%build
# no-op

%install
install -d %{buildroot}%{_datadir}/devenv-lsp-setup
install -m 0644 lsp-config.lua treesitter-config.lua plugins-config.lua \
  vim-ale-config.vim README.md \
  %{buildroot}%{_datadir}/devenv-lsp-setup/

# Neovim packpath
install -d %{buildroot}%{_datadir}/nvim/site/pack/devenv-lsp/start/devenv-lsp/lua
install -m 0644 lsp-config.lua treesitter-config.lua plugins-config.lua \
  %{buildroot}%{_datadir}/nvim/site/pack/devenv-lsp/start/devenv-lsp/lua/

# Vim plugin (separate subpackage)
install -d %{buildroot}%{_datadir}/vim/vimfiles/plugin
install -m 0644 vim-ale-config.vim \
  %{buildroot}%{_datadir}/vim/vimfiles/plugin/devenv-lsp-ale.vim

%files
%license LICENSE
%doc README.md
%dir %{_datadir}/devenv-lsp-setup
%{_datadir}/devenv-lsp-setup/lsp-config.lua
%{_datadir}/devenv-lsp-setup/treesitter-config.lua
%{_datadir}/devenv-lsp-setup/plugins-config.lua
%{_datadir}/devenv-lsp-setup/vim-ale-config.vim
%{_datadir}/devenv-lsp-setup/README.md

%files -n devenv-lsp-setup-neovim
%{_datadir}/nvim/site/pack/devenv-lsp/

%files -n devenv-lsp-setup-vim
%{_datadir}/vim/vimfiles/plugin/devenv-lsp-ale.vim

%changelog
* Fri Nov 13 2026 David Sedgmen <dsedgmen@users.noreply.github.com> - 1.0.0-1
- Initial RPM with separate neovim and vim subpackages
