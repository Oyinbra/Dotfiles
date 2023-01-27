local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim' -- Packer Installation
  use {'nvim-treesitter/nvim-treesitter', run = ":TSUpdate"}
  use 'nvim-tree/nvim-web-devicons' -- Icons for programming languages
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  } -- Status Bar
  use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

  -- use 'neoclide/coc.nvim' -- Auto completion
  -- :CocInstall coc-python | :CocInstall coc-clangd | :CocInstall coc-snippets
  -- :CocCommand snippets.edit... FOR EACH FILE TYPE

  use 'sheerun/vim-polyglot' -- Better Syntax Support

  use {
  'nvim-tree/nvim-tree.lua',
  requires = 'nvim-tree/nvim-web-devicons', -- optional, for file icons
  }

  use 'bronson/vim-trailing-whitespace' -- highlight trailing spaces

  use 'jiangmiao/auto-pairs' -- Auto pairs for '(' '[' '{'
  use 'tpope/vim-surround' -- Surrounding ysw

  use 'mattn/emmet-vim'

  use 'airblade/vim-gitgutter'

  use 'tpope/vim-commentary' -- gcc = comment | gc = uncomment

  use 'junegunn/fzf.vim' -- :Ag = searches directory and file content

  use 'tpope/vim-fugitive' -- Fugutive is a git command wrapper

  use 'codota/tabnine-nvim'

  use 'frazrepo/vim-rainbow'

  use 'dmerejkowsky/vim-ale' -- ALE for displayong errors and warnings in real time

  use 'preservim/tagbar' -- Tag bar | fh = opens the side bar

  use 'glepnir/dashboard-nvim'

  use 'lifepillar/pgsql.vim' -- PSQL pluging needs :SQLSetType pgsql.vim
  -- use 'ap/vim-css-color' -- CSS Color Preview
  use 'rafi/awesome-vim-colorschemes' -- Color Schemes
  -- use 'ryanoasis/vim-devicons' -- Developer Icons
  use 'tc50cal/vim-terminal' -- Vim Terminal
  use 'terryma/vim-multiple-cursors' -- CTRL + N for multiple cursors
  if packer_bootstrap then
    require('packer').sync()
  end
end)
