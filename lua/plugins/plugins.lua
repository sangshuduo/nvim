-- custom/plugins/init.lua has to return a table
-- THe plugin name is github user or organization name/reponame

return {
    {
      "yetone/avante.nvim",
      event = "VeryLazy",
      lazy = false,
      version = false, -- Set this to "*" to always pull the latest release version, or set it to false to update to the latest code changes.
      opts = {
        -- add any opts here
        -- for example
--         provider = "openai",
--         openai = {
--           endpoint = "https://api.openai.com/v1",
--           model = "gpt-4o", -- your desired model (or use gpt-4o, etc.)
--           timeout = 30000, -- timeout in milliseconds
--           temperature = 0, -- adjust if needed
--           max_tokens = 4096,
--           reasoning_effort = "high" -- only supported for "o" models
--         },
            provider = "ollama",
            ollama = {
                model = "deepseek-r1:8b"
            }
      },
      -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
      build = "make",
      -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
      dependencies = {
        "stevearc/dressing.nvim",
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        --- The below dependencies are optional,
        "echasnovski/mini.pick", -- for file_selector provider mini.pick
        "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
        "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
        "ibhagwan/fzf-lua", -- for file_selector provider fzf
        "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
        "zbirenbaum/copilot.lua", -- for providers='copilot'
        {
          -- support for image pasting
          "HakonHarnes/img-clip.nvim",
          event = "VeryLazy",
          opts = {
            -- recommended settings
            default = {
              embed_image_as_base64 = false,
              prompt_for_file_name = false,
              drag_and_drop = {
                insert_mode = true,
              },
              -- required for Windows users
              use_absolute_path = true,
            },
          },
        },
        {
          -- Make sure to set this up properly if you have lazy=true
          'MeanderingProgrammer/render-markdown.nvim',
          opts = {
            file_types = { "markdown", "Avante" },
          },
          ft = { "markdown", "Avante" },
        },
      },
    },
    {'skywind3000/vim-gpt-commit',
        config = function ()
        vim.g.gpt_commit_key = 'your key'
        -- uncomment this line below to enable proxy
        -- vim.g.gpt_commit_proxy = 'socks5://127.0.0.1:1080'
        end,
    },
    {'edluffy/hologram.nvim', lazy = false,
        config = function()
            require('hologram').setup({
                auto_display = true -- WIP. Will display 'Hologram' on CursorHold events
        })
        end,
    },
    {"poljar/typos.nvim", lazy=false,
        config = function()
            require("typos").setup()
        end,
    },
    {"RRethy/vim-illuminate", lazy = false},
    {"MattesGroeger/vim-bookmarks", lazy = false},
    {"vim-scripts/c.vim", lazy = false},
    {"luochen1990/rainbow",
        lazy = false,
        enable = true,
    },
    {"tamton-aquib/zone.nvim", lazy = true,
        config = function()
            require("zone").setup({
                require('zone').setup {
                    style = "treadmill",
                    after = 30,          -- Idle timeout
                    exclude_filetypes = { "TelescopePrompt", "NvimTree", "neo-tree", "dashboard", "lazy" },
                    -- More options to come later

                    treadmill = {
                        direction = "left",
                        headache = true,
                        tick_time = 30,     -- Lower, the faster
                        -- Opts for Treadmill style
                    },
                    epilepsy = {
                        stage = "aura",     -- "aura" or "ictal"
                        tick_time = 100,
                    },
                    dvd = {
                        -- text = {"line1", "line2", "line3", "etc"}
                        tick_time = 100,
                        -- Opts for Dvd style
                    },
                    -- etc
                }
            })
        end,
    },
    {"liuchengxu/vista.vim", lazy = false},
    {"skywind3000/asyncrun.vim", lazy = false},
    {"wellle/context.vim", lazy = false},
    {"rhysd/vim-clang-format", lazy = false},
   -- {"Exafunction/codeium.vim", lazy = false},
    { 'augmentcode/augment.vim', lazy = false },
    -- {"github/copilot.vim", lazy = false},
    {'danilamihailov/beacon.nvim', lazy = false},
    {'neoclide/coc.nvim', lazy = false},
    {'williamboman/warden.nvim', lazy = false, line_highlight = true},
    {'tamton-aquib/duck.nvim',
        lazy = false,
        config = function()
            vim.keymap.set('n', '<leader>dd', function() require("duck").hatch("🦀") end, {})
            vim.keymap.set('n', '<leader>dk', function() require("duck").cook() end, {})
        end
    },
    {'p00f/clangd_extensions.nvim', lazy = false,
        commit = "798e377ec859087132b81d2f347b5080580bd6b1",
        config = function()
            require("clangd_extensions").setup {
                server = {
                    -- options to pass to nvim-lspconfig
                    -- i.e. the arguments to require("lspconfig").clangd.setup({})
                },
                extensions = {
                    -- defaults:
                    -- Automatically set inlay hints (type hints)
                    autoSetHints = true,
                    -- These apply to the default ClangdSetInlayHints command
                    inlay_hints = {
                        -- Only show inlay hints for the current line
                        only_current_line = false,
                        -- Event which triggers a refersh of the inlay hints.
                        -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
                        -- not that this may cause  higher CPU usage.
                        -- This option is only respected when only_current_line and
                        -- autoSetHints both are true.
                        only_current_line_autocmd = "CursorHold",
                        -- whether to show parameter hints with the inlay hints or not
                        show_parameter_hints = true,
                        -- prefix for parameter hints
                        parameter_hints_prefix = "<- ",
                        -- prefix for all the other hints (type, chaining)
                        other_hints_prefix = "=> ",
                        -- whether to align to the length of the longest line in the file
                        max_len_align = false,
                        -- padding from the left if max_len_align is true
                        max_len_align_padding = 1,
                        -- whether to align to the extreme right or not
                        right_align = false,
                        -- padding from the right if right_align is true
                        right_align_padding = 7,
                        -- The color of the hints
                        highlight = "Comment",
                        -- The highlight group priority for extmark
                        priority = 100,
                    },
                    ast = {
                        -- These are unicode, should be available in any font
                        role_icons = {
                            type = "🄣",
                            declaration = "🄓",
                            expression = "🄔",
                            statement = ";",
                            specifier = "🄢",
                            ["template argument"] = "🆃",
                        },
                        kind_icons = {
                            Compound = "🄲",
                            Recovery = "🅁",
                            TranslationUnit = "🅄",
                            PackExpansion = "🄿",
                            TemplateTypeParm = "🅃",
                            TemplateTemplateParm = "🅃",
                            TemplateParamObject = "🅃",
                        },
                        --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
                            role_icons = {
                                type = "",
                                declaration = "",
                                expression = "",
                                specifier = "",
                                statement = "",
                                ["template argument"] = "",
                            },

                            kind_icons = {
                                Compound = "",
                                Recovery = "",
                                TranslationUnit = "",
                                PackExpansion = "",
                                TemplateTypeParm = "",
                                TemplateTemplateParm = "",
                                TemplateParamObject = "",
                        }, ]]
                        highlights = {
                            detail = "Comment",
                        },
                    },
                    memory_usage = {
                        border = "none",
                    },
                    symbol_info = {
                        border = "none",
                    },
                },
            }
        end,
    },
    {'simrat39/inlay-hints.nvim', lazy = false,
        config = function()
            require("inlay-hints").setup({
                only_current_line = true,

                eol = {
                    right_align = true,
                }
            })
        end,
    },
    {"saecki/crates.nvim",
        lazy = false,
        tag = 'v0.2.1',
        config = function()
            require('crates').setup()
        end,
    },
    {"folke/todo-comments.nvim",
        -- PERF: test perf?
        -- HACK: bruh
        -- TODO: wew
        -- NOTE:  sdkfj dkfjskdf
        -- ERROR: --
        -- FIX: fixed
        -- WARNING: test done
        lazy = false,
        config = function()
            require("todo-comments").setup {
                keywords = {
                    FIX = {
                        color = "error", -- can be a hex color, or a named color (see below)
                        alt = {"ERR"},
                    },
                    TODO = {
                        color = "info",
                        alt = {"VERB", "DEBG"},
                    },
                    PERF = {
                        alt = {"OK"},
                    },
                },
                highlight = {
                    comments_only = false, -- uses treesitter to match keywords in comments only
                    pattern = [[.*<(KEYWORDS)\s*]], -- pattern or table of patterns, used for highlightng (vim regex)
                }
        }
        end
    },
    {'simrat39/rust-tools.nvim', lazy = false,
        config = function()
            local ih = require("inlay-hints")
            require("rust-tools").setup({
                tools = {
                    on_initialized = function()
                        ih.set_all()
                    end,
                    autosethints = true,
                    inlay_hints = {
                        auto = true,
                        show_parameter_hints = true,
                    },
                    hover_actions = {
                        auto_focus = true
                    },
                },
                server = {
                    on_attach = function(c, b)
                        ih.on_attach(c, b)
                    end,
                },
            })
        end,
    },
    {'mfussenegger/nvim-dap', lazy = false},
    {'voldikss/vim-floaterm', lazy = false}
}

