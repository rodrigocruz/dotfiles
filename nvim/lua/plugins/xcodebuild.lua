return {
  "wojciech-kulik/xcodebuild.nvim",
  cmd = {
    "XcodebuildBuild",
    "XcodebuildBuildForTesting",
    "XcodebuildBuildRun",
    "XcodebuildCodeActions",
    "XcodebuildFailingSnapshots",
    "XcodebuildPicker",
    "XcodebuildProjectManager",
    "XcodebuildQuickfixLine",
    "XcodebuildSelectDevice",
    "XcodebuildSelectTestPlan",
    "XcodebuildSetup",
    "XcodebuildShowCodeCoverageReport",
    "XcodebuildTest",
    "XcodebuildTestClass",
    "XcodebuildTestExplorerToggle",
    "XcodebuildTestRepeat",
    "XcodebuildTestSelected",
    "XcodebuildToggleCodeCoverage",
    "XcodebuildToggleLogs",
  },
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    require("xcodebuild").setup({
      -- put some options here or leave it empty to use default settings
    })
  end,
}
