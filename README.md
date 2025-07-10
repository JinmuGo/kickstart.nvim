# Modular Neovim Config

## Introduction

This configuration has been refactored into a modular structure for better maintainability.

## Directory Structure

### Basic Structure

```text
nvim/
├── init.lua                # Main entry point. Loads core and plugins modules.
└── lua/
    ├── core/               # Collection of core Neovim settings.
    │   ├── options.lua       # Vim-related options (set).
    │   ├── keymaps.lua       # Basic keymaps that don't depend on plugins.
    │   └── lazy_bootstrap.lua # Installation and setup for the lazy.nvim plugin manager.
    │
    └── plugins/            # All plugin configurations.
                              # .lua files here are automatically loaded by lazy.nvim.
        ├── colorscheme.lua
        ├── telescope.lua
        └── ... (Other plugins)
```
