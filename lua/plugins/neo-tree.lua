-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    -- '\' 키를 눌렀을 때 현재 파일 위치를 Neo-tree에서 보여주도록 설정 (기존 설정 유지)
    { '<leader>e', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  opts = {
    -- 마지막 창일 경우 Neo-tree 닫기
    close_if_last_window = true,
    popup_border_style = 'rounded',
    enable_git_status = true,
    enable_diagnostics = true,
    window = {
      -- Neo-tree 창이 열릴 위치와 크기 설정
      position = 'left',
      width = 30,
      -- ✅ 사용자가 요청한 키 매핑 및 추천 매핑
      mappings = {
        -- 창 닫기 (기존 설정 유지 및 추가)
        ['<leader>e'] = 'close_window',
        ['q'] = 'close_window',

        -- 열기 및 닫기 (요청하신 핵심 기능)
        ['l'] = 'open',
        ['h'] = 'close_node',

        -- 기본 및 추천 키 매핑
        ['o'] = 'open',
        ['<cr>'] = 'open', -- 엔터 키
        ['S'] = 'open_split', -- 수직 분할 창으로 열기
        ['s'] = 'open_vsplit', -- 수평 분할 창으로 열기 (s가 보통 수직 분할에 많이 쓰여서 vsplit으로 설정)
        ['<space>'] = 'none', -- 스페이스바 기본 동작 비활성화

        -- 파일 및 폴더 관리
        ['a'] = 'add', -- 파일/폴더 추가
        ['d'] = 'delete', -- 파일/폴더 삭제
        ['r'] = 'rename', -- 이름 변경
        ['c'] = 'copy', -- 복사
        ['p'] = 'paste', -- 붙여넣기
        ['x'] = 'cut', -- 잘라내기
        ['y'] = 'copy_to_clipboard', -- 경로 복사

        -- 기타 유용한 기능
        ['?'] = 'show_help', -- 도움말 보기
        ['H'] = 'toggle_hidden', -- 숨김 파일 보이기/숨기기
        ['R'] = 'refresh', -- 새로고침
      },
    },
    filesystem = {
      filtered_items = {
        visible = false, -- 숨김 파일 기본적으로 보이지 않게 설정
        hide_dotfiles = true,
        hide_gitignored = true,
      },
      -- 파일 탐색 시 항상 시스템의 루트부터 시작하지 않고, Neovim이 실행된 프로젝트 루트를 기준으로 함
      follow_current_file = {
        enabled = true,
      },
      hijack_netrw_behavior = 'open_current', -- netrw 대신 Neo-tree 사용
    },
    -- 다른 소스(git_status, buffers 등)에도 동일한 창 매핑 적용
    git_status = {
      window = {
        mappings = {
          ['l'] = 'open',
          ['h'] = 'close_node',
        },
      },
    },
    buffers = {
      window = {
        mappings = {
          ['l'] = 'open',
          ['d'] = 'buffer_delete',
        },
      },
    },
  },
}
