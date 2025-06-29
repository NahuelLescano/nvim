# NVIM Configs

¡Bienvenido a mi configuración personal de Neovim!  
Acá vas a encontrar todo lo que uso para tener un entorno de desarrollo ágil, minimalista y potente, ideal para frontend, scripting y cualquier cosa que pinte.

---

## Package Manager

Uso [Lazy.nvim](https://github.com/folke/lazy.nvim) como gestor de plugins. Es rápido, declarativo y te deja tener todo bajo control sin dramas.

---

## Plugins Principales

Estos son los plugins que tengo instalados y por qué los uso:

- [Oil](https://github.com/stevearc/oil.nvim): Explorador de archivos tipo vim-vinegar, pero más piola. Te deja editar el filesystem como si fuera un buffer más.
- [blink.cmp](https://github.com/Saghen/blink.cmp): Autocompletado con soporte para LSP y fuentes externas, actualiza en cada tecla.  
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig): Soporte para Language Server Protocol. Uso [mason.nvim](https://github.com/williamboman/mason.nvim) para instalar los servidores fácil.
- [todo-comments.nvim](https://github.com/folke/todo-comments.nvim): Resalta TODO, HACK, BUG y otros comentarios clave.  
- [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim): Statusline configurable y rapidísima.
- [Harpoon 2](https://github.com/ThePrimeagen/harpoon): Navegación ultra rápida entre archivos favoritos.
- [Trouble.nvim](https://github.com/folke/trouble.nvim): Lista visual para diagnósticos, referencias, quickfix, etc.  
- [undotree](https://github.com/mbbill/undotree): Visualizá el historial de cambios como corresponde.
- [Telescope.nvim](https://github.com/nvim-telescope/telescope.nvim): Búsqueda y navegación por el proyecto. Lo uso junto a fzf para máxima velocidad.
- [catppuccin](https://github.com/catppuccin/nvim): Mi esquema de colores favorito, suave y legible.
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter): Highlighting de sintaxis avanzado y parsing inteligente.

---

## Otras Configuraciones

Además, tengo algunos tweaks y plugins propios:

- **ftplugin**: Configuraciones específicas por tipo de archivo.
- **muligrep**: Plugin personal para buscar en todos los archivos del proyecto.
- **menu**: Menús contextuales custom, accesibles con click derecho.

---

## Inspiración

Gran parte de esta config está inspirada en los videos de [TJ DeVries (Advent of Code)](https://www.youtube.com/watch?v=WsKSuQSutaI).  
¡Recomendadísimo si querés aprender a tunear tu Neovim!

Tambien, uso configuraciones del capo de Gentleman Programming.
