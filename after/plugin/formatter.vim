lua << EOF
    local formatter = require'formatter'
    formatter.setup({
        filetype = {
            cpp = {
                -- clang-format
                function()
                    return {
                        exe = "/usr/local/llvm-9.0/bin/clang-format",
                        args = {"--assume-filename", vim.api.nvim_buf_get_name(0)},
                        stdin = true,
                        cwd = vim.fn.expand('%:p:h')  -- Run clang-format in cwd of the file.
                    }
                end
            },
            rust = {
                -- Rustfmt
                function()
                    return {
                        exe = "rustfmt",
                        args = {"--emit=stdout"},
                        stdin = true
                    }
                end
            },
            typescript = {
                -- prettier
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)), '--single-quote'},
                        stdin = true
                    }
                end
            },
            typescriptreact = {
                function()
                    return {
                        exe = "prettier",
                        args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0), '--single-quote'},
                        stdin = true
                    }
                end
            },
        }
    })
EOF
nnoremap <silent> <leader>f :Format<CR>
