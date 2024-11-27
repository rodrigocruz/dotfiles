return {
  "vim-test/vim-test",
  dependencies = { "voldikss/vim-floaterm" },
  config = function()
    vim.cmd([[
      let test#php#phpunit#options = '--colors=always'
      let test#php#pest#options = '--colors=always'

    function! FloatermStrategy(cmd)
      execute 'FloatermToggle'
      execute 'FloatermSend! '
      execute 'FloatermSend! clear'
      execute 'FloatermSend! '. a:cmd . ' |less -X'
    endfunction

      let g:test#custom_strategies = {'floaterm': function('FloatermStrategy')}
      let g:test#strategy = 'floaterm'
    ]])
  end,
}
