test\minimal_init.lua:nvim_lsp[name].setup {
test\lspconfig_spec.lua:        lspconfig.util.on_setup = function(config)
test\lspconfig_spec.lua:        configs['test'].setup(user_config)
test\lspconfig_spec.lua:        lspconfig.rust_analyzer.setup {}
test\lspconfig_spec.lua:    it('provides user_config to the on_setup hook', function()
test\lspconfig_spec.lua:        util.on_setup = function (_, _user_config)
test\lspconfig_spec.lua:        lspconfig.rust_analyzer.setup { custom_user_config = "custom" }
scripts\docgen.lua:require'lspconfig'.{{template_name}}.setup{}
README.md:2. Add the language server setup to your init.lua.
README.md:   require'lspconfig'.pyright.setup{}
README.md:5. See [Suggested configuration](#Suggested-configuration) to setup common mappings and omnifunc completion.
README.md:See [server_configurations.md](doc/server_configurations.md) (`:help lspconfig-all` from Nvim) for the full list of configs, including installation instructions and additional, optional, customization suggestions for each language server. For servers that are not on your system path (e.g., `jdtls`, `elixirls`), you must manually add `cmd` to the `setup` parameter. Most language servers can be installed in less than a minute.
README.md:Note: you must pass the defined `on_attach` as an argument to **every `setup {}` call** and the keybindings in `on_attach` **only take effect on buffers with an active language server**. 
README.md:require('lspconfig')['pyright'].setup{
README.md:require('lspconfig')['tsserver'].setup{
README.md:require('lspconfig')['rust_analyzer'].setup{
README.md:4. You must pass `on_attach` and `capabilities` for **each** `setup {}` if you want these to take effect. 
README.md:5. **Do not call `setup {}` twice for the same server**. The second call to `setup {}` will overwrite the first.
README.md:* `:LspStart <config_name>` Start the requested server name. Will only successfully start if the command detects a root directory matching the current config. Pass `autostart = false` to your `.setup{}` call for a language server if you would like to launch clients solely with this command. Defaults to all servers matching current buffer filetype.
README.md:a new configuration for it helps others, especially if the server requires special setup. Follow these steps:
lua\lspconfig.lua:      return { setup = function() end }
lua\lspconfig\util.lua:-- global on_setup hook
lua\lspconfig\util.lua:M.on_setup = nil
lua\lspconfig\util.lua:            '[lspconfig] cmd not defined for %q. Manually set cmd in the setup {} call according to server_configurations.md, see :help lspconfig-index.',
lua\lspconfig\ui\lspinfo.lua:  no_filetype_defined = 'No filetypes defined, Please define filetypes in setup()',
lua\lspconfig\ui\lspinfo.lua:  [error_messages.no_filetype_defined] = { 'lspconfig-setup' },
lua\lspconfig\server_configurations\ccls.lua:lspconfig.ccls.setup {
lua\lspconfig\server_configurations\cssls.lua:Neovim does not currently include built-in snippets. `vscode-css-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
lua\lspconfig\server_configurations\cssls.lua:require'lspconfig'.cssls.setup {
lua\lspconfig\server_configurations\elixirls.lua:require'lspconfig'.elixirls.setup{
lua\lspconfig\server_configurations\esbonio.lua:require'lspconfig'.esbonio.setup {
lua\lspconfig\server_configurations\esbonio.lua:require'lspconfig'.esbonio.setup {
lua\lspconfig\server_configurations\flow.lua:See below for how to setup Flow itself.
lua\lspconfig\server_configurations\groovyls.lua:require'lspconfig'.groovyls.setup{
lua\lspconfig\server_configurations\haxe_language_server.lua:After building the language server, set the `cmd` setting in your setup
lua\lspconfig\server_configurations\haxe_language_server.lua:lspconfig.haxe_language_server.setup({
lua\lspconfig\server_configurations\hhvm.lua:See below for how to setup HHVM & typechecker:
lua\lspconfig\server_configurations\html.lua:To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
lua\lspconfig\server_configurations\html.lua:require'lspconfig'.html.setup {
lua\lspconfig\server_configurations\jdtls.lua:  require'lspconfig'.jdtls.setup{}
lua\lspconfig\server_configurations\jdtls.lua:      require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
lua\lspconfig\server_configurations\jsonls.lua:Neovim does not currently include built-in snippets. `vscode-json-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
lua\lspconfig\server_configurations\jsonls.lua:require'lspconfig'.jsonls.setup {
lua\lspconfig\server_configurations\lean3ls.lua:that plugin fully handles the setup of the Lean language server,
lua\lspconfig\server_configurations\leanls.lua:that plugin fully handles the setup of the Lean language server,
lua\lspconfig\server_configurations\metals.lua:Note: that if you're using [nvim-metals](https://github.com/scalameta/nvim-metals), that plugin fully handles the setup and installation of Metals, and you shouldn't set up Metals both with it and `lspconfig`.
lua\lspconfig\server_configurations\ntt.lua:Can be configured by passing a "settings" object to `ntt.setup{}`:
lua\lspconfig\server_configurations\ntt.lua:require('lspconfig').ntt.setup{
lua\lspconfig\server_configurations\omnisharp.lua:require'lspconfig'.omnisharp.setup {
lua\lspconfig\server_configurations\jedi_language_server.lua:  'setup.py',
lua\lspconfig\server_configurations\jedi_language_server.lua:  'setup.cfg',
lua\lspconfig\server_configurations\efm.lua:require('lspconfig')['efm'].setup{
lua\lspconfig\server_configurations\efm.lua:specify `filetypes` in your call to `setup{}`**. Otherwise `lspconfig` will launch EFM on the `BufEnter` instead
lua\lspconfig\server_configurations\efm.lua:require('lspconfig')['efm'].setup{
lua\lspconfig\server_configurations\powershell_es.lua:require'lspconfig'.powershell_es.setup{
lua\lspconfig\server_configurations\powershell_es.lua:require'lspconfig'.powershell_es.setup{
lua\lspconfig\server_configurations\powershell_es.lua:require'lspconfig'.powershell_es.setup{
lua\lspconfig\server_configurations\bicep.lua:require'lspconfig'.bicep.setup{
lua\lspconfig\server_configurations\pylsp.lua:        'setup.py',
lua\lspconfig\server_configurations\pylsp.lua:        'setup.cfg',
lua\lspconfig\server_configurations\pylsp.lua:In order to configure an option, it must be translated to a nested Lua table and included in the `settings` argument to the `setup{}` function.
lua\lspconfig\server_configurations\pylsp.lua:require'lspconfig'.pylsp.setup{
lua\lspconfig\server_configurations\pyright.lua:  'setup.py',
lua\lspconfig\server_configurations\pyright.lua:  'setup.cfg',
lua\lspconfig\server_configurations\arduino_language_server.lua:language server in your setup:
lua\lspconfig\server_configurations\arduino_language_server.lua:require'lspconfig'.arduino_language_server.setup {
lua\lspconfig\server_configurations\apex_ls.lua:require'lspconfig'.apex_ls.setup {
lua\lspconfig\server_configurations\relay_lsp.lua:    require'lspconfig'.relay_lsp.setup {
lua\lspconfig\server_configurations\rls.lua:See https://github.com/rust-lang/rls#setup to setup rls itself.
lua\lspconfig\server_configurations\rls.lua:nvim_lsp.rls.setup {
lua\lspconfig\server_configurations\angularls.lua:    -- in an angular monorepo setup.
lua\lspconfig\server_configurations\angularls.lua:require'lspconfig'.angularls.setup{
lua\lspconfig\server_configurations\anakin_language_server.lua:        'setup.py',
lua\lspconfig\server_configurations\anakin_language_server.lua:        'setup.cfg',
lua\lspconfig\server_configurations\als.lua:Can be configured by passing a "settings" object to `als.setup{}`:
lua\lspconfig\server_configurations\als.lua:require('lspconfig').als.setup{
lua\lspconfig\configs.lua:  function M.setup(user_config)
lua\lspconfig\configs.lua:    if util.on_setup then
lua\lspconfig\configs.lua:      pcall(util.on_setup, config, user_config)
lua\lspconfig\configs.lua:          M._setup_buffer(client.id, bufnr)
lua\lspconfig\configs.lua:                M._setup_buffer(client.id, bufnr)
lua\lspconfig\configs.lua:  function M._setup_buffer(client_id, bufnr)
doc\lspconfig.txt:    require'lspconfig'.clangd.setup{}
doc\lspconfig.txt:THE SETUP METAMETHOD                                           *lspconfig-setup*
doc\lspconfig.txt:configuration exposes a `setup {}` metamethod which makes it easy to directly
doc\lspconfig.txt:`setup {}` is the primary interface by which users interact with `lspconfig`.
doc\lspconfig.txt:    require'lspconfig'.clangd.setup{}
doc\lspconfig.txt:The purpose of `setup{}` is to wrap the call to Nvim's built-in 
doc\lspconfig.txt:The `setup{}` function takes a table which contains a superset of the keys
doc\lspconfig.txt:Note: all entries passed to `setup {}` override the entry in the default
doc\lspconfig.txt:additionally be overridden via the `setup {}` call. The most commonly
doc\lspconfig.txt:passed overrides to `setup {}` are:
doc\lspconfig.txt:  setup. See |lsp-handler|.
doc\lspconfig.txt:  the settings field in `setup {}` as follows:
doc\lspconfig.txt:  require('lspconfig').pyright.setup{
doc\lspconfig.txt:`setup {}` can additionally override these defaults in subsequent calls.
doc\lspconfig.txt:SETUP HOOK                                                *lspconfig-setup-hook*
doc\lspconfig.txt:`lspconfig` will execute the `on_setup` hook for each setup call to a server after
doc\lspconfig.txt:  lspconfig.util.on_setup = util.add_hook_before(lspconfig.util.on_setup, function(config)
doc\lspconfig.txt:While the `setup {}` function is the primary interface to `lspconfig`, for
doc\lspconfig.txt:  require("lspconfig")['pyright'].setup({
doc\lspconfig.txt:an object with a `setup()` method, to be invoked by users:
doc\lspconfig.txt:    require'lspconfig'.SERVER_NAME.setup{}
doc\lspconfig.txt:3. call `setup()` to enable the FileType autocmd >
doc\lspconfig.txt:   lspconfig.foo_lsp.setup{}
doc\lspconfig.txt:`setup`.
doc\lspconfig.txt:The `root_dir` key in `config` and `setup` can hold any function of the form
doc\lspconfig.txt:  require('lspconfig')['pyright'].setup{
doc\lspconfig.txt:  require('lspconfig')['tsserver'].setup{
doc\lspconfig.txt:  require('lspconfig')['rust_analyzer'].setup{
doc\server_configurations.txt:Can be configured by passing a "settings" object to `als.setup{}`:
doc\server_configurations.txt:require('lspconfig').als.setup{
doc\server_configurations.txt:require'lspconfig'.als.setup{}
doc\server_configurations.txt:require'lspconfig'.anakin_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.angularls.setup{
doc\server_configurations.txt:require'lspconfig'.angularls.setup{}
doc\server_configurations.txt:require'lspconfig'.ansiblels.setup{}
doc\server_configurations.txt:require'lspconfig'.antlersls.setup{}
doc\server_configurations.txt:require'lspconfig'.apex_ls.setup {
doc\server_configurations.txt:require'lspconfig'.apex_ls.setup{}
doc\server_configurations.txt:language server in your setup:
doc\server_configurations.txt:require'lspconfig'.arduino_language_server.setup {
doc\server_configurations.txt:require'lspconfig'.arduino_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.asm_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.astro.setup{}
doc\server_configurations.txt:require'lspconfig'.awk_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.bashls.setup{}
doc\server_configurations.txt:require'lspconfig'.beancount.setup{}
doc\server_configurations.txt:require'lspconfig'.bicep.setup{
doc\server_configurations.txt:require'lspconfig'.bicep.setup{}
doc\server_configurations.txt:require'lspconfig'.blueprint_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.bsl_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.bufls.setup{}
doc\server_configurations.txt:lspconfig.ccls.setup {
doc\server_configurations.txt:require'lspconfig'.ccls.setup{}
doc\server_configurations.txt:require'lspconfig'.clangd.setup{}
doc\server_configurations.txt:require'lspconfig'.clarity_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.clojure_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.cmake.setup{}
doc\server_configurations.txt:require'lspconfig'.codeqlls.setup{}
doc\server_configurations.txt:require'lspconfig'.crystalline.setup{}
doc\server_configurations.txt:require'lspconfig'.csharp_ls.setup{}
doc\server_configurations.txt:Neovim does not currently include built-in snippets. `vscode-css-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.txt:require'lspconfig'.cssls.setup {
doc\server_configurations.txt:require'lspconfig'.cssls.setup{}
doc\server_configurations.txt:require'lspconfig'.cssmodules_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.cucumber_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.dafny.setup{}
doc\server_configurations.txt:require'lspconfig'.dagger.setup{}
doc\server_configurations.txt:require'lspconfig'.dartls.setup{}
doc\server_configurations.txt:require'lspconfig'.denols.setup{}
doc\server_configurations.txt:require'lspconfig'.dhall_lsp_server.setup{}
doc\server_configurations.txt:require'lspconfig'.diagnosticls.setup{}
doc\server_configurations.txt:require'lspconfig'.dockerls.setup{}
doc\server_configurations.txt:require'lspconfig'.dolmenls.setup{}
doc\server_configurations.txt:require'lspconfig'.dotls.setup{}
doc\server_configurations.txt:require('lspconfig')['efm'].setup{
doc\server_configurations.txt:specify `filetypes` in your call to `setup{}`**. Otherwise `lspconfig` will launch EFM on the `BufEnter` instead
doc\server_configurations.txt:require('lspconfig')['efm'].setup{
doc\server_configurations.txt:require'lspconfig'.efm.setup{}
doc\server_configurations.txt:require'lspconfig'.elixirls.setup{
doc\server_configurations.txt:require'lspconfig'.elixirls.setup{}
doc\server_configurations.txt:require'lspconfig'.elmls.setup{}
doc\server_configurations.txt:require'lspconfig'.ember.setup{}
doc\server_configurations.txt:require'lspconfig'.emmet_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.erg_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.erlangls.setup{}
doc\server_configurations.txt:require'lspconfig'.esbonio.setup {
doc\server_configurations.txt:require'lspconfig'.esbonio.setup {
doc\server_configurations.txt:require'lspconfig'.esbonio.setup{}
doc\server_configurations.txt:require'lspconfig'.eslint.setup{}
doc\server_configurations.txt:require'lspconfig'.fennel-ls.setup{}
doc\server_configurations.txt:See below for how to setup Flow itself.
doc\server_configurations.txt:require'lspconfig'.flow.setup{}
doc\server_configurations.txt:require'lspconfig'.flux_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.foam_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.fortls.setup{}
doc\server_configurations.txt:require'lspconfig'.fsautocomplete.setup{}
doc\server_configurations.txt:require'lspconfig'.fsharp_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.fstar.setup{}
doc\server_configurations.txt:require'lspconfig'.gdscript.setup{}
doc\server_configurations.txt:require'lspconfig'.ghcide.setup{}
doc\server_configurations.txt:require'lspconfig'.ghdl_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.gleam.setup{}
doc\server_configurations.txt:require'lspconfig'.glint.setup{}
doc\server_configurations.txt:require'lspconfig'.glslls.setup{}
doc\server_configurations.txt:require'lspconfig'.golangci_lint_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.gopls.setup{}
doc\server_configurations.txt:require'lspconfig'.gradle_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.grammarly.setup{}
doc\server_configurations.txt:require'lspconfig'.graphql.setup{}
doc\server_configurations.txt:require'lspconfig'.groovyls.setup{
doc\server_configurations.txt:require'lspconfig'.groovyls.setup{}
doc\server_configurations.txt:After building the language server, set the `cmd` setting in your setup
doc\server_configurations.txt:lspconfig.haxe_language_server.setup({
doc\server_configurations.txt:require'lspconfig'.haxe_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.hdl_checker.setup{}
doc\server_configurations.txt:See below for how to setup HHVM & typechecker:
doc\server_configurations.txt:require'lspconfig'.hhvm.setup{}
doc\server_configurations.txt:require'lspconfig'.hie.setup{}
doc\server_configurations.txt:require'lspconfig'.hls.setup{}
doc\server_configurations.txt:require'lspconfig'.hoon_ls.setup{}
doc\server_configurations.txt:To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.txt:require'lspconfig'.html.setup {
doc\server_configurations.txt:require'lspconfig'.html.setup{}
doc\server_configurations.txt:require'lspconfig'.idris2_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.intelephense.setup{}
doc\server_configurations.txt:require'lspconfig'.java_language_server.setup{}
doc\server_configurations.txt:  require'lspconfig'.jdtls.setup{}
doc\server_configurations.txt:      require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
doc\server_configurations.txt:require'lspconfig'.jdtls.setup{}
doc\server_configurations.txt:require'lspconfig'.jedi_language_server.setup{}
doc\server_configurations.txt:Neovim does not currently include built-in snippets. `vscode-json-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.txt:require'lspconfig'.jsonls.setup {
doc\server_configurations.txt:require'lspconfig'.jsonls.setup{}
doc\server_configurations.txt:require'lspconfig'.jsonnet_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.julials.setup{}
doc\server_configurations.txt:require'lspconfig'.kotlin_language_server.setup{}
doc\server_configurations.txt:that plugin fully handles the setup of the Lean language server,
doc\server_configurations.txt:require'lspconfig'.lean3ls.setup{}
doc\server_configurations.txt:that plugin fully handles the setup of the Lean language server,
doc\server_configurations.txt:require'lspconfig'.leanls.setup{}
doc\server_configurations.txt:require'lspconfig'.lelwel_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.lemminx.setup{}
doc\server_configurations.txt:require'lspconfig'.ltex.setup{}
doc\server_configurations.txt:require'lspconfig'.luau_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.m68k.setup{}
doc\server_configurations.txt:require'lspconfig'.marksman.setup{}
doc\server_configurations.txt:Note: that if you're using [nvim-metals](https://github.com/scalameta/nvim-metals), that plugin fully handles the setup and installation of Metals, and you shouldn't set up Metals both with it and `lspconfig`.
doc\server_configurations.txt:require'lspconfig'.metals.setup{}
doc\server_configurations.txt:require'lspconfig'.millet.setup{}
doc\server_configurations.txt:require'lspconfig'.mint.setup{}
doc\server_configurations.txt:require'lspconfig'.mlir_lsp_server.setup{}
doc\server_configurations.txt:require'lspconfig'.mlir_pdll_lsp_server.setup{}
doc\server_configurations.txt:require'lspconfig'.mm0_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.move_analyzer.setup{}
doc\server_configurations.txt:require'lspconfig'.neocmake.setup{}
doc\server_configurations.txt:require'lspconfig'.nickel_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.nil_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.nimls.setup{}
doc\server_configurations.txt:Can be configured by passing a "settings" object to `ntt.setup{}`:
doc\server_configurations.txt:require('lspconfig').ntt.setup{
doc\server_configurations.txt:require'lspconfig'.ntt.setup{}
doc\server_configurations.txt:require'lspconfig'.nxls.setup{}
doc\server_configurations.txt:require'lspconfig'.ocamlls.setup{}
doc\server_configurations.txt:require'lspconfig'.ocamllsp.setup{}
doc\server_configurations.txt:require'lspconfig'.ols.setup{}
doc\server_configurations.txt:require'lspconfig'.omnisharp.setup {
doc\server_configurations.txt:require'lspconfig'.omnisharp.setup{}
doc\server_configurations.txt:require'lspconfig'.opencl_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.openscad_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.pasls.setup{}
doc\server_configurations.txt:require'lspconfig'.perlls.setup{}
doc\server_configurations.txt:require'lspconfig'.perlnavigator.setup{}
doc\server_configurations.txt:require'lspconfig'.perlpls.setup{}
doc\server_configurations.txt:require'lspconfig'.phan.setup{}
doc\server_configurations.txt:require'lspconfig'.phpactor.setup{}
doc\server_configurations.txt:require'lspconfig'.please.setup{}
doc\server_configurations.txt:require'lspconfig'.powershell_es.setup{
doc\server_configurations.txt:require'lspconfig'.powershell_es.setup{
doc\server_configurations.txt:require'lspconfig'.powershell_es.setup{
doc\server_configurations.txt:require'lspconfig'.powershell_es.setup{}
doc\server_configurations.txt:require'lspconfig'.prismals.setup{}
doc\server_configurations.txt:require'lspconfig'.prolog_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.prosemd_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.psalm.setup{}
doc\server_configurations.txt:require'lspconfig'.puppet.setup{}
doc\server_configurations.txt:require'lspconfig'.purescriptls.setup{}
doc\server_configurations.txt:In order to configure an option, it must be translated to a nested Lua table and included in the `settings` argument to the `setup{}` function.
doc\server_configurations.txt:require'lspconfig'.pylsp.setup{
doc\server_configurations.txt:require'lspconfig'.pylsp.setup{}
doc\server_configurations.txt:require'lspconfig'.pyre.setup{}
doc\server_configurations.txt:require'lspconfig'.pyright.setup{}
doc\server_configurations.txt:require'lspconfig'.qml_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.qmlls.setup{}
doc\server_configurations.txt:require'lspconfig'.quick_lint_js.setup{}
doc\server_configurations.txt:require'lspconfig'.r_language_server.setup{}
doc\server_configurations.txt:require'lspconfig'.racket_langserver.setup{}
doc\server_configurations.txt:require'lspconfig'.reason_ls.setup{}
doc\server_configurations.txt:    require'lspconfig'.relay_lsp.setup {
doc\server_configurations.txt:require'lspconfig'.relay_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.remark_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.rescriptls.setup{}
doc\server_configurations.txt:See https://github.com/rust-lang/rls#setup to setup rls itself.
doc\server_configurations.txt:nvim_lsp.rls.setup {
doc\server_configurations.txt:require'lspconfig'.rls.setup{}
doc\server_configurations.txt:require'lspconfig'.rnix.setup{}
doc\server_configurations.txt:require'lspconfig'.robotframework_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.rome.setup{}
doc\server_configurations.txt:require'lspconfig'.ruby_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.rust_analyzer.setup{}
doc\server_configurations.txt:require'lspconfig'.salt_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.scheme_langserver.setup{}
doc\server_configurations.txt:require'lspconfig'.scry.setup{}
doc\server_configurations.txt:require'lspconfig'.serve_d.setup{}
doc\server_configurations.txt:require'lspconfig'.sixtyfps.setup{}
doc\server_configurations.txt:require'lspconfig'.slint_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.smarty_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.solang.setup{}
doc\server_configurations.txt:require'lspconfig'.solargraph.setup{}
doc\server_configurations.txt:require'lspconfig'.solc.setup{}
doc\server_configurations.txt:require'lspconfig'.solidity.setup{}
doc\server_configurations.txt:require'lspconfig'.solidity_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.sorbet.setup{}
doc\server_configurations.txt:require'lspconfig'.sourcekit.setup{}
doc\server_configurations.txt:require'lspconfig'.sourcery.setup {
doc\server_configurations.txt:require'lspconfig'.sourcery.setup{}
doc\server_configurations.txt:require'lspconfig'.spectral.setup{}
doc\server_configurations.txt:require'lspconfig'.sqlls.setup{}
doc\server_configurations.txt:require'lspconfig'.sqls.setup{
doc\server_configurations.txt:require'lspconfig'.sqls.setup{}
doc\server_configurations.txt:require'lspconfig'.steep.setup{}
doc\server_configurations.txt:Can be configured by passing a `settings.stylelintplus` object to `stylelint_lsp.setup`:
doc\server_configurations.txt:require'lspconfig'.stylelint_lsp.setup{
doc\server_configurations.txt:require'lspconfig'.stylelint_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.sumneko_lua.setup {
doc\server_configurations.txt:require'lspconfig'.sumneko_lua.setup{}
doc\server_configurations.txt:Note: assuming that [tsserver](#tsserver) is setup, full JavaScript/TypeScript support (find references, rename, etc of symbols in Svelte files when working in JS/TS files) requires per-project installation and configuration of [typescript-svelte-plugin](https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin#usage).
doc\server_configurations.txt:require'lspconfig'.svelte.setup{}
doc\server_configurations.txt:require'lspconfig'.svlangserver.setup{}
doc\server_configurations.txt:require'lspconfig'.svls.setup{}
doc\server_configurations.txt:require'lspconfig'.syntax_tree.setup{}
doc\server_configurations.txt:require'lspconfig'.tailwindcss.setup{}
doc\server_configurations.txt:require'lspconfig'.taplo.setup{}
doc\server_configurations.txt:require'lspconfig'.tblgen_lsp_server.setup{}
doc\server_configurations.txt:require'lspconfig'.teal_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.terraform_lsp.setup{}
doc\server_configurations.txt:require'lspconfig'.terraformls.setup{}
doc\server_configurations.txt:require'lspconfig'.texlab.setup{}
doc\server_configurations.txt:require'lspconfig'.tflint.setup{}
doc\server_configurations.txt:require lspconfig.theme_check.setup {
doc\server_configurations.txt:require'lspconfig'.theme_check.setup{}
doc\server_configurations.txt:require'lspconfig'.tilt_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.tsserver.setup{}
doc\server_configurations.txt:require'lspconfig'.turtle_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.typeprof.setup{}
doc\server_configurations.txt:require'lspconfig'.unison.setup{}
doc\server_configurations.txt:require'lspconfig'.vala_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.vdmj.setup{}
doc\server_configurations.txt:require'lspconfig'.verible.setup{}
doc\server_configurations.txt:require'lspconfig'.veridian.setup{}
doc\server_configurations.txt:require'lspconfig'.vimls.setup{}
doc\server_configurations.txt:require'lspconfig'.visualforce_ls.setup {
doc\server_configurations.txt:require'lspconfig'.visualforce_ls.setup{}
doc\server_configurations.txt:require'lspconfig'.vls.setup{}
doc\server_configurations.txt:To enable Take Over Mode, override the default filetypes in `setup{}` as follows:
doc\server_configurations.txt:require'lspconfig'.volar.setup{
doc\server_configurations.txt:require'lspconfig'.volar.setup{
doc\server_configurations.txt:require'lspconfig'.volar.setup{
doc\server_configurations.txt:require'lspconfig'.volar.setup{}
doc\server_configurations.txt:require'lspconfig'.vuels.setup{}
doc\server_configurations.txt:require'lspconfig'.wgsl_analyzer.setup{}
doc\server_configurations.txt:require('lspconfig').yamlls.setup {
doc\server_configurations.txt:  ... -- other configuration for setup {}
doc\server_configurations.txt:require('lspconfig').yamlls.setup {
doc\server_configurations.txt:  ... -- other configuration for setup {}
doc\server_configurations.txt:require'lspconfig'.yamlls.setup{}
doc\server_configurations.txt:require'lspconfig'.zk.setup{}
doc\server_configurations.txt:require'lspconfig'.zls.setup{}
doc\server_configurations.md:Can be configured by passing a "settings" object to `als.setup{}`:
doc\server_configurations.md:require('lspconfig').als.setup{
doc\server_configurations.md:require'lspconfig'.als.setup{}
doc\server_configurations.md:require'lspconfig'.anakin_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.angularls.setup{
doc\server_configurations.md:require'lspconfig'.angularls.setup{}
doc\server_configurations.md:require'lspconfig'.ansiblels.setup{}
doc\server_configurations.md:require'lspconfig'.antlersls.setup{}
doc\server_configurations.md:require'lspconfig'.apex_ls.setup {
doc\server_configurations.md:require'lspconfig'.apex_ls.setup{}
doc\server_configurations.md:language server in your setup:
doc\server_configurations.md:require'lspconfig'.arduino_language_server.setup {
doc\server_configurations.md:require'lspconfig'.arduino_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.asm_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.astro.setup{}
doc\server_configurations.md:require'lspconfig'.awk_ls.setup{}
doc\server_configurations.md:require'lspconfig'.bashls.setup{}
doc\server_configurations.md:require'lspconfig'.beancount.setup{}
doc\server_configurations.md:require'lspconfig'.bicep.setup{
doc\server_configurations.md:require'lspconfig'.bicep.setup{}
doc\server_configurations.md:require'lspconfig'.blueprint_ls.setup{}
doc\server_configurations.md:require'lspconfig'.bsl_ls.setup{}
doc\server_configurations.md:require'lspconfig'.bufls.setup{}
doc\server_configurations.md:lspconfig.ccls.setup {
doc\server_configurations.md:require'lspconfig'.ccls.setup{}
doc\server_configurations.md:require'lspconfig'.clangd.setup{}
doc\server_configurations.md:require'lspconfig'.clarity_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.clojure_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.cmake.setup{}
doc\server_configurations.md:require'lspconfig'.codeqlls.setup{}
doc\server_configurations.md:require'lspconfig'.crystalline.setup{}
doc\server_configurations.md:require'lspconfig'.csharp_ls.setup{}
doc\server_configurations.md:Neovim does not currently include built-in snippets. `vscode-css-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.md:require'lspconfig'.cssls.setup {
doc\server_configurations.md:require'lspconfig'.cssls.setup{}
doc\server_configurations.md:require'lspconfig'.cssmodules_ls.setup{}
doc\server_configurations.md:require'lspconfig'.cucumber_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.dafny.setup{}
doc\server_configurations.md:require'lspconfig'.dagger.setup{}
doc\server_configurations.md:require'lspconfig'.dartls.setup{}
doc\server_configurations.md:require'lspconfig'.denols.setup{}
doc\server_configurations.md:require'lspconfig'.dhall_lsp_server.setup{}
doc\server_configurations.md:require'lspconfig'.diagnosticls.setup{}
doc\server_configurations.md:require'lspconfig'.dockerls.setup{}
doc\server_configurations.md:require'lspconfig'.dolmenls.setup{}
doc\server_configurations.md:require'lspconfig'.dotls.setup{}
doc\server_configurations.md:require('lspconfig')['efm'].setup{
doc\server_configurations.md:specify `filetypes` in your call to `setup{}`**. Otherwise `lspconfig` will launch EFM on the `BufEnter` instead
doc\server_configurations.md:require('lspconfig')['efm'].setup{
doc\server_configurations.md:require'lspconfig'.efm.setup{}
doc\server_configurations.md:require'lspconfig'.elixirls.setup{
doc\server_configurations.md:require'lspconfig'.elixirls.setup{}
doc\server_configurations.md:require'lspconfig'.elmls.setup{}
doc\server_configurations.md:require'lspconfig'.ember.setup{}
doc\server_configurations.md:require'lspconfig'.emmet_ls.setup{}
doc\server_configurations.md:require'lspconfig'.erg_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.erlangls.setup{}
doc\server_configurations.md:require'lspconfig'.esbonio.setup {
doc\server_configurations.md:require'lspconfig'.esbonio.setup {
doc\server_configurations.md:require'lspconfig'.esbonio.setup{}
doc\server_configurations.md:require'lspconfig'.eslint.setup{}
doc\server_configurations.md:require'lspconfig'.fennel-ls.setup{}
doc\server_configurations.md:See below for how to setup Flow itself.
doc\server_configurations.md:require'lspconfig'.flow.setup{}
doc\server_configurations.md:require'lspconfig'.flux_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.foam_ls.setup{}
doc\server_configurations.md:require'lspconfig'.fortls.setup{}
doc\server_configurations.md:require'lspconfig'.fsautocomplete.setup{}
doc\server_configurations.md:require'lspconfig'.fsharp_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.fstar.setup{}
doc\server_configurations.md:require'lspconfig'.gdscript.setup{}
doc\server_configurations.md:require'lspconfig'.ghcide.setup{}
doc\server_configurations.md:require'lspconfig'.ghdl_ls.setup{}
doc\server_configurations.md:require'lspconfig'.gleam.setup{}
doc\server_configurations.md:require'lspconfig'.glint.setup{}
doc\server_configurations.md:require'lspconfig'.glslls.setup{}
doc\server_configurations.md:require'lspconfig'.golangci_lint_ls.setup{}
doc\server_configurations.md:require'lspconfig'.gopls.setup{}
doc\server_configurations.md:require'lspconfig'.gradle_ls.setup{}
doc\server_configurations.md:require'lspconfig'.grammarly.setup{}
doc\server_configurations.md:require'lspconfig'.graphql.setup{}
doc\server_configurations.md:require'lspconfig'.groovyls.setup{
doc\server_configurations.md:require'lspconfig'.groovyls.setup{}
doc\server_configurations.md:After building the language server, set the `cmd` setting in your setup
doc\server_configurations.md:lspconfig.haxe_language_server.setup({
doc\server_configurations.md:require'lspconfig'.haxe_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.hdl_checker.setup{}
doc\server_configurations.md:See below for how to setup HHVM & typechecker:
doc\server_configurations.md:require'lspconfig'.hhvm.setup{}
doc\server_configurations.md:require'lspconfig'.hie.setup{}
doc\server_configurations.md:require'lspconfig'.hls.setup{}
doc\server_configurations.md:require'lspconfig'.hoon_ls.setup{}
doc\server_configurations.md:To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.md:require'lspconfig'.html.setup {
doc\server_configurations.md:require'lspconfig'.html.setup{}
doc\server_configurations.md:require'lspconfig'.idris2_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.intelephense.setup{}
doc\server_configurations.md:require'lspconfig'.java_language_server.setup{}
doc\server_configurations.md:  require'lspconfig'.jdtls.setup{}
doc\server_configurations.md:      require'lspconfig'.jdtls.setup{ cmd = { 'jdtls' } }
doc\server_configurations.md:require'lspconfig'.jdtls.setup{}
doc\server_configurations.md:require'lspconfig'.jedi_language_server.setup{}
doc\server_configurations.md:Neovim does not currently include built-in snippets. `vscode-json-language-server` only provides completions when snippet support is enabled. To enable completion, install a snippet plugin and add the following override to your language client capabilities during setup.
doc\server_configurations.md:require'lspconfig'.jsonls.setup {
doc\server_configurations.md:require'lspconfig'.jsonls.setup{}
doc\server_configurations.md:require'lspconfig'.jsonnet_ls.setup{}
doc\server_configurations.md:require'lspconfig'.julials.setup{}
doc\server_configurations.md:require'lspconfig'.kotlin_language_server.setup{}
doc\server_configurations.md:that plugin fully handles the setup of the Lean language server,
doc\server_configurations.md:require'lspconfig'.lean3ls.setup{}
doc\server_configurations.md:that plugin fully handles the setup of the Lean language server,
doc\server_configurations.md:require'lspconfig'.leanls.setup{}
doc\server_configurations.md:require'lspconfig'.lelwel_ls.setup{}
doc\server_configurations.md:require'lspconfig'.lemminx.setup{}
doc\server_configurations.md:require'lspconfig'.ltex.setup{}
doc\server_configurations.md:require'lspconfig'.luau_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.m68k.setup{}
doc\server_configurations.md:require'lspconfig'.marksman.setup{}
doc\server_configurations.md:Note: that if you're using [nvim-metals](https://github.com/scalameta/nvim-metals), that plugin fully handles the setup and installation of Metals, and you shouldn't set up Metals both with it and `lspconfig`.
doc\server_configurations.md:require'lspconfig'.metals.setup{}
doc\server_configurations.md:require'lspconfig'.millet.setup{}
doc\server_configurations.md:require'lspconfig'.mint.setup{}
doc\server_configurations.md:require'lspconfig'.mlir_lsp_server.setup{}
doc\server_configurations.md:require'lspconfig'.mlir_pdll_lsp_server.setup{}
doc\server_configurations.md:require'lspconfig'.mm0_ls.setup{}
doc\server_configurations.md:require'lspconfig'.move_analyzer.setup{}
doc\server_configurations.md:require'lspconfig'.neocmake.setup{}
doc\server_configurations.md:require'lspconfig'.nickel_ls.setup{}
doc\server_configurations.md:require'lspconfig'.nil_ls.setup{}
doc\server_configurations.md:require'lspconfig'.nimls.setup{}
doc\server_configurations.md:Can be configured by passing a "settings" object to `ntt.setup{}`:
doc\server_configurations.md:require('lspconfig').ntt.setup{
doc\server_configurations.md:require'lspconfig'.ntt.setup{}
doc\server_configurations.md:require'lspconfig'.nxls.setup{}
doc\server_configurations.md:require'lspconfig'.ocamlls.setup{}
doc\server_configurations.md:require'lspconfig'.ocamllsp.setup{}
doc\server_configurations.md:require'lspconfig'.ols.setup{}
doc\server_configurations.md:require'lspconfig'.omnisharp.setup {
doc\server_configurations.md:require'lspconfig'.omnisharp.setup{}
doc\server_configurations.md:require'lspconfig'.opencl_ls.setup{}
doc\server_configurations.md:require'lspconfig'.openscad_ls.setup{}
doc\server_configurations.md:require'lspconfig'.pasls.setup{}
doc\server_configurations.md:require'lspconfig'.perlls.setup{}
doc\server_configurations.md:require'lspconfig'.perlnavigator.setup{}
doc\server_configurations.md:require'lspconfig'.perlpls.setup{}
doc\server_configurations.md:require'lspconfig'.phan.setup{}
doc\server_configurations.md:require'lspconfig'.phpactor.setup{}
doc\server_configurations.md:require'lspconfig'.please.setup{}
doc\server_configurations.md:require'lspconfig'.powershell_es.setup{
doc\server_configurations.md:require'lspconfig'.powershell_es.setup{
doc\server_configurations.md:require'lspconfig'.powershell_es.setup{
doc\server_configurations.md:require'lspconfig'.powershell_es.setup{}
doc\server_configurations.md:require'lspconfig'.prismals.setup{}
doc\server_configurations.md:require'lspconfig'.prolog_ls.setup{}
doc\server_configurations.md:require'lspconfig'.prosemd_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.psalm.setup{}
doc\server_configurations.md:require'lspconfig'.puppet.setup{}
doc\server_configurations.md:require'lspconfig'.purescriptls.setup{}
doc\server_configurations.md:In order to configure an option, it must be translated to a nested Lua table and included in the `settings` argument to the `setup{}` function.
doc\server_configurations.md:require'lspconfig'.pylsp.setup{
doc\server_configurations.md:require'lspconfig'.pylsp.setup{}
doc\server_configurations.md:require'lspconfig'.pyre.setup{}
doc\server_configurations.md:require'lspconfig'.pyright.setup{}
doc\server_configurations.md:require'lspconfig'.qml_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.qmlls.setup{}
doc\server_configurations.md:require'lspconfig'.quick_lint_js.setup{}
doc\server_configurations.md:require'lspconfig'.r_language_server.setup{}
doc\server_configurations.md:require'lspconfig'.racket_langserver.setup{}
doc\server_configurations.md:require'lspconfig'.reason_ls.setup{}
doc\server_configurations.md:    require'lspconfig'.relay_lsp.setup {
doc\server_configurations.md:require'lspconfig'.relay_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.remark_ls.setup{}
doc\server_configurations.md:require'lspconfig'.rescriptls.setup{}
doc\server_configurations.md:See https://github.com/rust-lang/rls#setup to setup rls itself.
doc\server_configurations.md:nvim_lsp.rls.setup {
doc\server_configurations.md:require'lspconfig'.rls.setup{}
doc\server_configurations.md:require'lspconfig'.rnix.setup{}
doc\server_configurations.md:require'lspconfig'.robotframework_ls.setup{}
doc\server_configurations.md:require'lspconfig'.rome.setup{}
doc\server_configurations.md:require'lspconfig'.ruby_ls.setup{}
doc\server_configurations.md:require'lspconfig'.rust_analyzer.setup{}
doc\server_configurations.md:require'lspconfig'.salt_ls.setup{}
doc\server_configurations.md:require'lspconfig'.scheme_langserver.setup{}
doc\server_configurations.md:require'lspconfig'.scry.setup{}
doc\server_configurations.md:require'lspconfig'.serve_d.setup{}
doc\server_configurations.md:require'lspconfig'.sixtyfps.setup{}
doc\server_configurations.md:require'lspconfig'.slint_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.smarty_ls.setup{}
doc\server_configurations.md:require'lspconfig'.solang.setup{}
doc\server_configurations.md:require'lspconfig'.solargraph.setup{}
doc\server_configurations.md:require'lspconfig'.solc.setup{}
doc\server_configurations.md:require'lspconfig'.solidity.setup{}
doc\server_configurations.md:require'lspconfig'.solidity_ls.setup{}
doc\server_configurations.md:require'lspconfig'.sorbet.setup{}
doc\server_configurations.md:require'lspconfig'.sourcekit.setup{}
doc\server_configurations.md:require'lspconfig'.sourcery.setup {
doc\server_configurations.md:require'lspconfig'.sourcery.setup{}
doc\server_configurations.md:require'lspconfig'.spectral.setup{}
doc\server_configurations.md:require'lspconfig'.sqlls.setup{}
doc\server_configurations.md:require'lspconfig'.sqls.setup{
doc\server_configurations.md:require'lspconfig'.sqls.setup{}
doc\server_configurations.md:require'lspconfig'.steep.setup{}
doc\server_configurations.md:Can be configured by passing a `settings.stylelintplus` object to `stylelint_lsp.setup`:
doc\server_configurations.md:require'lspconfig'.stylelint_lsp.setup{
doc\server_configurations.md:require'lspconfig'.stylelint_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.sumneko_lua.setup {
doc\server_configurations.md:require'lspconfig'.sumneko_lua.setup{}
doc\server_configurations.md:Note: assuming that [tsserver](#tsserver) is setup, full JavaScript/TypeScript support (find references, rename, etc of symbols in Svelte files when working in JS/TS files) requires per-project installation and configuration of [typescript-svelte-plugin](https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin#usage).
doc\server_configurations.md:require'lspconfig'.svelte.setup{}
doc\server_configurations.md:require'lspconfig'.svlangserver.setup{}
doc\server_configurations.md:require'lspconfig'.svls.setup{}
doc\server_configurations.md:require'lspconfig'.syntax_tree.setup{}
doc\server_configurations.md:require'lspconfig'.tailwindcss.setup{}
doc\server_configurations.md:require'lspconfig'.taplo.setup{}
doc\server_configurations.md:require'lspconfig'.tblgen_lsp_server.setup{}
doc\server_configurations.md:require'lspconfig'.teal_ls.setup{}
doc\server_configurations.md:require'lspconfig'.terraform_lsp.setup{}
doc\server_configurations.md:require'lspconfig'.terraformls.setup{}
doc\server_configurations.md:require'lspconfig'.texlab.setup{}
doc\server_configurations.md:require'lspconfig'.tflint.setup{}
doc\server_configurations.md:require lspconfig.theme_check.setup {
doc\server_configurations.md:require'lspconfig'.theme_check.setup{}
doc\server_configurations.md:require'lspconfig'.tilt_ls.setup{}
doc\server_configurations.md:require'lspconfig'.tsserver.setup{}
doc\server_configurations.md:require'lspconfig'.turtle_ls.setup{}
doc\server_configurations.md:require'lspconfig'.typeprof.setup{}
doc\server_configurations.md:require'lspconfig'.unison.setup{}
doc\server_configurations.md:require'lspconfig'.vala_ls.setup{}
doc\server_configurations.md:require'lspconfig'.vdmj.setup{}
doc\server_configurations.md:require'lspconfig'.verible.setup{}
doc\server_configurations.md:require'lspconfig'.veridian.setup{}
doc\server_configurations.md:require'lspconfig'.vimls.setup{}
doc\server_configurations.md:require'lspconfig'.visualforce_ls.setup {
doc\server_configurations.md:require'lspconfig'.visualforce_ls.setup{}
doc\server_configurations.md:require'lspconfig'.vls.setup{}
doc\server_configurations.md:To enable Take Over Mode, override the default filetypes in `setup{}` as follows:
doc\server_configurations.md:require'lspconfig'.volar.setup{
doc\server_configurations.md:require'lspconfig'.volar.setup{
doc\server_configurations.md:require'lspconfig'.volar.setup{
doc\server_configurations.md:require'lspconfig'.volar.setup{}
doc\server_configurations.md:require'lspconfig'.vuels.setup{}
doc\server_configurations.md:require'lspconfig'.wgsl_analyzer.setup{}
doc\server_configurations.md:require('lspconfig').yamlls.setup {
doc\server_configurations.md:  ... -- other configuration for setup {}
doc\server_configurations.md:require('lspconfig').yamlls.setup {
doc\server_configurations.md:  ... -- other configuration for setup {}
doc\server_configurations.md:require'lspconfig'.yamlls.setup{}
doc\server_configurations.md:require'lspconfig'.zk.setup{}
doc\server_configurations.md:require'lspconfig'.zls.setup{}
lua\lspconfig\server_configurations\sourcery.lua:  'setup.py',
lua\lspconfig\server_configurations\sourcery.lua:  'setup.cfg',
lua\lspconfig\server_configurations\sourcery.lua:require'lspconfig'.sourcery.setup {
lua\lspconfig\server_configurations\sqls.lua:require'lspconfig'.sqls.setup{
lua\lspconfig\server_configurations\stylelint_lsp.lua:Can be configured by passing a `settings.stylelintplus` object to `stylelint_lsp.setup`:
lua\lspconfig\server_configurations\stylelint_lsp.lua:require'lspconfig'.stylelint_lsp.setup{
lua\lspconfig\server_configurations\sumneko_lua.lua:require'lspconfig'.sumneko_lua.setup {
lua\lspconfig\server_configurations\svelte.lua:Note: assuming that [tsserver](#tsserver) is setup, full JavaScript/TypeScript support (find references, rename, etc of symbols in Svelte files when working in JS/TS files) requires per-project installation and configuration of [typescript-svelte-plugin](https://github.com/sveltejs/language-tools/tree/master/packages/typescript-plugin#usage).
CONTRIBUTING.md:  'setup.py',
CONTRIBUTING.md:  'setup.cfg',
lua\lspconfig\server_configurations\theme_check.lua:require lspconfig.theme_check.setup {
lua\lspconfig\server_configurations\visualforce_ls.lua:require'lspconfig'.visualforce_ls.setup {
lua\lspconfig\server_configurations\volar.lua:To enable Take Over Mode, override the default filetypes in `setup{}` as follows:
lua\lspconfig\server_configurations\volar.lua:require'lspconfig'.volar.setup{
lua\lspconfig\server_configurations\volar.lua:require'lspconfig'.volar.setup{
lua\lspconfig\server_configurations\volar.lua:require'lspconfig'.volar.setup{
lua\lspconfig\server_configurations\yamlls.lua:require('lspconfig').yamlls.setup {
lua\lspconfig\server_configurations\yamlls.lua:  ... -- other configuration for setup {}
lua\lspconfig\server_configurations\yamlls.lua:require('lspconfig').yamlls.setup {
lua\lspconfig\server_configurations\yamlls.lua:  ... -- other configuration for setup {}
