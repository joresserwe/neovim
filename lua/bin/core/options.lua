
local options = {
  autoindent = true,                       -- 자동 드여쓰기 기능
  backspace = "indent,eol,start",          -- Backspace로 지울 수 있는 문자 (indent: 공백, eol: 줄 끝, start: 줄 처음)
  breakindent = true,                      -- 자동 들여쓰기 기능
  backup = false,                          -- creates a backup file
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- mark down 파일에서 `` 내용을 가리지 않음
  encoding = "utf-8",
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- 검색 결과를 Highlight
  ignorecase = true,                       -- ignore case in search patterns
  inccommand = "split",                    -- 검색 결과를 바로바로 확
  laststatus = 2,                          -- 하단의 상태표시줄 표시
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- 자동완성 목록의 높이
  showcmd = true,                          -- 현재 입력중인 명령어 표시
  showmode = false,                        -- 현재 모드를 표시할 것인가 (Lualine 사용)
  showtabline = 2,                         -- always show tabs
  smartcase = true,                        -- smart case
  smarttab = true,                         -- Tab 키를 누르면 들여쓰기를 자동으로 맞춘다
  smartindent = true,                      -- 들여쓰기를 자동으로 맞춘다
  splitbelow = true,                       -- 가로 분할창을 아래에 연다
  splitright = true,                       -- 세로 분할창을 오른쪽에 연다
  swapfile = false,                        -- creates a swapfile
  timeoutlen = 1000,                       -- Mapping 된 Sequence를 기다리는 시간 (ms)
  title = true,                            -- title bar에 현재 파일 이름을 표시한다.
  undofile = true,                         -- undo 명령어를 통해 파일을 이전상태로 되돌린다
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- 다른 편집 프로그램에서 사용하면, 편집을 허용하지 않는다.
  expandtab = true,                        -- Tab 대신 Space를 사용함
  shiftwidth = 2,                          -- 들여쓰기에 사용되는 Space 개수
  tabstop = 2,                             -- Tab을 눌렸을 때 들여쓰기 되는 Space 개수
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- git등 수정된 라인을 표시한다.
  wrap = false,                            -- 긴 줄을 한줄로 표시한다
  scrolloff = 8,                           -- 수직 스크롤시 끝까지 내리면 위에 몇줄을 남길지??
  sidescrolloff = 8,                       -- 수평 스크롤시 몇줄을 남길지
  guifont = "monospace:h17",               -- gui 환경에서 사용할 폰트
}

vim.scriptencoding = "utf-8"
vim.wo.number = true
vim.opt.shortmess:append "c"
vim.opt.path:append "**" -- Finding files - Search down intop subfolders
vim.opt.wildignore:append "*/node_modules/*" -- File 이름을 자동 완성할 때 무시할 파일

-- Undercurl (Not working on Iterm2)
-- vim.cmd([[let &t_Cs = "\e[4:3m"]])
-- vim.cmd([[let &t_Cs = "\e[4:0m"]])

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  command = "set nopaste"
})

vim.opt.formatoptions:append "r"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]] -- '-'도 단어의 일부로 포함한다.
--vim.cmd [[set formatoptions-=cro]] --  this doesn't seem to work
