# Agent Instructions for Dotfiles Repository

## Overview
This is a personal dotfiles repository primarily containing Neovim configuration in Lua, along with configs for Hyprland, Kitty, Tmux, and other tools.

## Build/Lint/Test Commands
- **Lua formatting**: `stylua .` (4-space indentation, configured in `.stylua.toml`)
- **Lua linting**: `selene .` (configured in `selene.toml`, allows mixed tables)
- **No build/test commands** - this is a configuration repository

## Code Style Guidelines

### Lua Code (Neovim configs)
- **Indentation**: 4 spaces (never tabs)
- **Imports**: Use `require()` statements at top of file
- **Returns**: Plugin configs return tables with plugin specs
- **Naming**: snake_case for files and variables, kebab-case for plugin names
- **Function style**: Use `function()` not `=` for function definitions
- **Comments**: Use `--` for line comments, avoid block comments unless necessary
- **Tables**: Return plugin configuration tables, use array-style for plugin lists

### File Organization
- Plugin configs in `nvim/.config/nvim/lua/plugins/` as separate files
- Custom utilities in `nvim/.config/nvim/lua/jmattner/`
- Configuration modules in `nvim/.config/nvim/lua/config/`

### Error Handling
- Use vim.notify() for user-facing messages
- Prefer graceful degradation over hard failures