local icons     = VimConfig.icons
local gl        = require('galaxyline')
local gls = gl.section

local gps       = require("nvim-gps")
local condition = require('galaxyline.condition')
local fileinfo  = require('galaxyline.provider_fileinfo')
local vcs       = require('galaxyline.provider_vcs')
local package   = require("package-info")

gl.short_line_list = {'NvimTree', 'help', ''}

-- nightfly
local colors = {
  bg         = '#011627',
  fg         = '#c3ccdc',
  blue       = '#82aaff',
  cyan_blue  = '#296596',
  emerald    = '#21c7a8',
  green      = '#a1cd5e',
  indigo     = '#5e97ec',
  orange     = '#f78c6c',
  peach      = '#ffcb8b',
  purple     = '#ae81ff',
  red        = '#fc514e',
  tan        = '#ecc48d',
  turquoise  = '#7fdbca',
  violet     = '#c792ea',
  watermelon = '#ff5874',
  yellow     = '#e3d18a',
}
local mode_color = {
	c  = colors.violet, ['!'] = colors.red,
	i  = colors.green,   ic    = colors.yellow, ix     = colors.yellow,
	n  = colors.blue,
	no = colors.blue,    nov   = colors.blue,   noV    = colors.blue,
	r  = colors.cyan,    rm    = colors.cyan,   ['r?'] = colors.cyan,
	R  = colors.purple,  Rv    = colors.purple,
	s  = colors.orange,  S     = colors.orange, [''] = colors.orange,
	t  = colors.purple,
	v  = colors.red,     V     = colors.red,    [''] = colors.red,
}

gls.left[0] = { Mode = {
  highlight = {colors.fg, colors.bg},

  provider = function ()
    vim.api.nvim_command('hi GalaxyMode guifg='..mode_color[vim.fn.mode()])
    return "▌ "
  end,
}}

gls.left[1] = { FileIcon = {
	condition = condition.buffer_not_empty,
	highlight = {fileinfo.get_file_icon_color, colors.bg},
	provider  = 'FileIcon',
  separator = ' '
}}

gls.left[2] = { FileName = {
	condition = condition.buffer_not_empty,
	highlight = {colors.fg, colors.bg},
	provider  = 'FileName',
  separator = '|'
}}

gls.left[3] = { GitIcon = {
	highlight = {colors.orange, colors.bg},
  separator = ' ',

	provider = function ()
		local branch = vcs.get_git_branch()
    if (branch == nil) then return nil end
    return icons.git
	end,
}}

gls.left[4] = { Git = {
	condition = condition.check_git_workspace,
	highlight = {colors.white, colors.bg},
  separator = ' ',

	provider = function ()
		local branch = vcs.get_git_branch()
		if (branch == nil) then branch = '???' end
		return branch
	end,
}}

gls.left[5] = {
    DiffAdd = {
        provider = 'DiffAdd',
        condition = condition.check_git_workspace,
        icon = icons.gitAdd .. ' ',
        highlight = {colors.green, colors.bg, 'bold'}
    }
}
gls.left[6] =  {
    DiffModified = {
        provider = 'DiffModified',
        condition = condition.check_git_workspace,
        icon = ' 柳 ',
        highlight = {colors.blue, colors.bg}
    }
}
gls.left[7] = {
    DiffRemove = {
        provider = 'DiffRemove',
        condition = condition.check_git_workspace,
        icon = icons.gitRemove .. ' ',
        highlight = {colors.red, colors.bg},
        separator = '|'
    }
}

gls.left[8] = {
  nvimGPS = {
    highlight = {colors.white, colors.bg},
    provider = function()
      return gps.get_location()
    end,
    condition = function()
      return gps.is_available()
    end,
    separator = '  '
  }
}

gls.left[8] = {
  PackageInfoStatus = {
    provider = function()
      return package.get_status()
    end,
    condition = function()
      return string.len(package.get_status()) > 1
    end,
  },
}

gls.right[0] = { DiagnosticError = {
	highlight = {colors.red, colors.bg, 'bold'},

	provider = function ()
		local icon = icons.error .. ' '
		local count = vim.lsp.diagnostic.get_count(0, 'Error')

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[1] = { DiagnosticWarn = {
	highlight = {colors.yellow, colors.bg, 'bold'},

	provider = function ()
		local icon = icons.warningTriangle .. ' '
		local count = vim.lsp.diagnostic.get_count(0, 'Warning')

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[3] = { DiagnosticHint = {
	highlight = {colors.blue, colors.bg, 'bold'},

	provider = function ()
		local icon = icons.lightbulbOutline .. ' '
		local count = vim.lsp.diagnostic.get_count(0, 'Hint')

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[4] = { DiagnosticInfo = {
	highlight = {colors.cyan, colors.bg, 'bold'},
  separator = '',

	provider = function ()
		local icon = icons.info .. ' '
		local count = vim.lsp.diagnostic.get_count(0, 'Information')

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

-- gls.right[5] = { LineInfo = {
-- 	highlight = {colors.fg, colors.bg},
--
-- 	provider = function ()
-- 		local cursor = vim.api.nvim_win_get_cursor(0)
-- 		return cursor[1]..'·'..vim.api.nvim_buf_line_count(0)..':'..cursor[2]..' '
-- 	end,
-- }}

-- gls.right[6] = { FileEF = {
-- 	highlight = {colors.fg, colors.bg},
--
-- 	provider = function ()
-- 		local encode      = fileinfo.get_file_encode()
-- 		return encode
-- 	end,
-- }}

gls.short_line_left[0] = { FileIcon = { -- {{{2
	condition = condition.buffer_not_empty,
	highlight = {fileinfo.get_file_icon_color, colors.bg},
	provider  = 'FileIcon',
  separator = ' '
}}

gls.short_line_left[1] = { FileName = {
	condition = condition.buffer_not_empty,
	highlight = {colors.fg, colors.bg},
	provider  = 'FileName',
}}

gls.short_line_right[1] = { LineInfo = {
	highlight = {colors.fg, colors.bg},

	provider = function ()
		local cursor = vim.api.nvim_win_get_cursor(0)

		return cursor[1]..'·'..vim.api.nvim_buf_line_count(0)..':'..cursor[2]..' '
	end,
}}
