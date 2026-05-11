return {
  "ldelossa/gh.nvim",
  cmd = {
    "GHCloseCommit",
    "GHClosePR",
    "GHCloseReview",
    "GHCollapseCommit",
    "GHCollapsePR",
    "GHCollapseReview",
    "GHCreateThread",
    "GHDeleteReview",
    "GHExpandCommit",
    "GHExpandPR",
    "GHExpandReview",
    "GHNextThread",
    "GHOpenPR",
    "GHOpenToCommit",
    "GHOpenToPR",
    "GHPopOutCommit",
    "GHPopOutPR",
    "GHPreviewIssue",
    "GHPRDetails",
    "GHRefreshPR",
    "GHStartReview",
    "GHSubmitReview",
    "GHToggleThread",
  },
  dependencies = {
    {
      "ldelossa/litee.nvim",
      cmd = "LTPanel",
      config = function()
        require("litee.lib").setup()
      end,
    },
  },
  config = function()
    require("litee.gh").setup()
  end,
}
