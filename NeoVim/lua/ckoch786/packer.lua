-- packer initially manually installed with
-- git clone https://github.com/wbthomason/packer.nvim "C:\Users\CKoch\AppData\Local\nvim-data\site\pack\packer\start\packer.nvim"

print('ensure_packer')
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'\\site\\pack\\packer\\start\\packer.nvim'
    print('install_path:'..install_path)
    if fn.empty(fn.glob(install_path)) > 0 then    
        fn.system({'git', 'clone','https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd[[packadd packer.nvim]]
	return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

return require("packer").startup(function(use)
    use('wbthomason/packer.nvim')
    
    use("junegunn/vim-easy-align")

    use('junegunn/fzf', {
        ['do'] = function()
            vim.call('fzf#install')
        end
    })

    use('junegunn/fzf.vim')

    use('tpope/vim-fugitive')
    use('tpope/vim-surround')
    use('tpope/vim-commentary')

    use('OmniSharp/omnisharp')

    use('nvim-lua/plenary.nvim')
    use('nvim-treesitter/nvim-treesitter')
    use('nvim-telescope/telescope.nvim')

    use('thePrimeagen/harpoon')
    
    use('neovim/nvim-lspconfig') -- native LSP support
    use('hrsh7th/nvim-cmp') -- autocompletion framework
    use('hrsh7th/cmp-nvim-lsp') -- LSP autocompletion provider
    use('hrsh7th/nvim-compe')

    use('gruvbox-community/gruvbox')

    if packer_bootstrap then
        require('packer').sync()
    end
end)
