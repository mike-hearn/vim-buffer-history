if exists('g:loaded_buffer_history')
  finish
endif
let g:loaded_buffer_history = 1

augroup BufferHistory
  au!

  autocmd BufEnter * call buffer_history#add(winbufnr(0))
  autocmd BufWipeout * call buffer_history#remove(bufnr('<afile>'))
augroup END

command! BufferHistoryList call buffer_history#list()
command! BufferHistoryReset call buffer_history#reset()
command! -nargs=1 BufferHistoryJumpTo call buffer_history#jumpto(<f-args>)
command! -count=1 BufferHistoryBack call buffer_history#jump()
command! -count=1 BufferHistoryForward call buffer_history#jump(1)

nnoremap <silent> <Plug>(buffer-history-list) :BufferHistoryList<CR>
nnoremap <silent> <Plug>(buffer-history-back) :BufferHistoryBack<CR>
nnoremap <silent> <Plug>(buffer-history-forward) :BufferHistoryForward<CR>

if !exists('g:buffer_history_disable_mappings')
  nmap gbp <Plug>(buffer-history-back)
  nmap gbn <Plug>(buffer-history-forward)
endif
