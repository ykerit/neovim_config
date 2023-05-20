return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",
    channel = "stable",
    version = "latest",
    branch = "nightly",
    commit = nil,
    pin_plugins = nil,
    skip_prompts = false,
    show_changelog = true,
    auto_quit = false,
  },

  diagnostics = {
    virtual_text = true,
    underline = true,
  },

  lsp = {
    formatting = {
      format_on_save = {
        enabled = true,
      },
    },
    servers = {
      "pyright",
      "html",
      "cssls",
      "tsserver",
      "clangd",
      "tailwindcss",
      "rust_analyzer",
    },
    config = {
      rust_analyzer = {
        lens = { enable = false },
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },

  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },

  plugins = {
    { "goolord/alpha-nvim", enabled = false },
    { "rcarriga/nvim-notify", enabled = false },
    {
      "rebelot/heirline.nvim",
      opts = function(_, opts)
        opts.winbar = nil
        return opts
      end,
    },
    {
      "jose-elias-alvarez/null-ls.nvim",
      opts = function(_, config)
        local null_ls = require "null-ls"
        local b = null_ls.builtins
        config.sources = {
          -- webdev stuff
          b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
          b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
          -- Lua
          b.formatting.stylua,
          -- cpp
          b.formatting.clang_format,
          -- rust
          b.formatting.rustfmt.with {
            extra_args = function(params)
              local Path = require "plenary.path"
              local cargo_toml = Path:new(params.root .. "/" .. "Cargo.toml")

              if cargo_toml:exists() and cargo_toml:is_file() then
                for _, line in ipairs(cargo_toml:readlines()) do
                  local edition = line:match [[^edition%s*=%s*%"(%d+)%"]]
                  if edition then return { "--edition=" .. edition } end
                end
              end
              return { "--edition=2021" }
            end,
          },
        }
        return config
      end,
    },
  },
  mappings = {
    n = {
      -- better buffer navigation
      ["]b"] = false,
      ["[b"] = false,
      ["<S-l>"] = {
        function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
        desc = "Next buffer",
      },
      ["<S-h>"] = {
        function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
        desc = "Previous buffer",
      },
    },
    -- terminal mappings
    t = {
      ["jk"] = { "<C-\\><C-n>", desc = "Terminal normal mode" },
      ["<esc><esc>"] = { "<cmd>ToggleTerm<cr>", desc = "close term" },
    },
  },
  options = {
    opt = {
      guifont = { "MesloLGMDZ Nerd Font Mono:h16" },
    },
    g = {
      icons_enabled = false,
    },
  },
  polish = function() end,
}
