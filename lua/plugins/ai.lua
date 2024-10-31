return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        suggestion = { enabled = false },
        panel = { enabled = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    config = function()
      require("copilot_cmp").setup()
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      prompts = {
        Rewrite = {
          prompt = "/COPILOT_GENERATE Enhance the writing of the following code comment. Rewrite the text to make it more clear and concise withouth changing the tone or style:",
        },
      },
    },
    keys = {
      {
        "<leader>aw",
        "<cmd>CopilotChatRewrite<cr>",
        desc = "Rewrite",
        mode = { "n", "v" },
      },
      {
        "<leader>ae",
        "<cmd>CopilotChatExplain<cr>",
        desc = "Explain",
        mode = { "n", "v" },
      },
      {
        "<leader>ar",
        "<cmd>CopilotChatReview<cr>",
        desc = "Review",
        mode = { "n", "v" },
      },
      {
        "<leader>af",
        "<cmd>CopilotChatFix<cr>",
        desc = "Fix",
        mode = { "n", "v" },
      },
      {
        "<leader>ao",
        "<cmd>CopilotChatOptimize<cr>",
        desc = "Optimize",
        mode = { "n", "v" },
      },
      {
        "<leader>ad",
        "<cmd>CopilotChatDocs<cr>",
        desc = "Docs",
        mode = { "n", "v" },
      },
      {
        "<leader>at",
        "<cmd>CopilotChatTests<cr>",
        desc = "Tests",
        mode = { "n", "v" },
      },
      {
        "<leader>ac",
        "<cmd>CopilotChatCommit<cr>",
        desc = "COmmit",
        mode = { "n", "v" },
      },
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- Optional
      {
        "stevearc/dressing.nvim", -- Optional: Improves the default Neovim UI
        opts = {},
      },
    },
    config = function()
      require("codecompanion").setup({
        strategies = {
          chat = {
            adapter = "anthropic",
          },
          inline = {
            adapter = "anthropic",
          },
          agent = {
            adapter = "anthropic",
          },
        },
        adapters = {
          anthropic = function()
            return require("codecompanion.adapters").extend("anthropic", {
              env = {
                api_key = "cmd:pass apps/anthropic/api_key",
              },
            })
          end,
        },
        default_prompts = {
          ["Feedback"] = {
            strategy = "inline",
            description = "Improve feedback",
            prompts = {
              {
                role = "system",
                content = [[When improving feedback for colleagues and students, follow these steps:

  1. Thoroughly analyze the provided feedback section.
  2. Understand the context of this feedback:
     * What is the feedback about?
  3. Evaluate the current feedback:
     * Is it clear and concise?
     * Is it constructive, friendly, and respectful?
     * Does it provide actionable suggestions for improvement?
  4. Rewrite the feedback section incorporating the above considerations:
     * Maintain the original intent and all key points.
     * Ensure the tone is similar to the original.
     * Enhance clarity, conciseness, and positivity.
  5. Briefly explain the key changes made and the reasoning behind them.]],
              },
              {
                role = "user",
                content = function(context)
                  local buf_utils = require("codecompanion.utils.buffers")
                  local selection =
                    require("codecompanion.helpers.actions").get_code(
                      context.start_line,
                      context.end_line
                    )

                  return "### feedback\n\nFor context, this is the whole of the feedback I've writen so far:\n\n"
                    .. buf_utils.get_content(context.bufnr)
                    .. "\n\n"
                    .. "Please improve this section of the feedback:\n\n"
                    .. selection
                    .. "\n\n"
                end,
              },
            },
          },
        },
      })
    end,
    keys = {
      {
        "<leader>aa",
        "<cmd>CodeCompanionActions<cr>",
        desc = "Code Compation Actions",
        mode = { "n", "v" },
      },
    },
  },
}
