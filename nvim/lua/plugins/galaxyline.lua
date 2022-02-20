local icons     = VimConfig.icons
local colors    = VimConfig.colors
local gl        = require('galaxyline')
local gls       = gl.section

local condition = require('galaxyline.condition')
local fileinfo  = require('galaxyline.provider_fileinfo')

gl.short_line_list = {'NvimTree', 'help', ''}

local bg = colors.black3;
local fg = colors.white;

local mode_color = {
	c  = colors.mauve, ['!'] = colors.red,
	i  = colors.green,   ic    = colors.yellow, ix     = colors.yellow,
	n  = colors.blue,
	no = colors.blue,    nov   = colors.blue,   noV    = colors.blue,
	r  = colors.sky,    rm    = colors.sky,   ['r?'] = colors.sky,
	R  = colors.mauve,  Rv    = colors.mauve,
	s  = colors.peach,  S     = colors.peach, [''] = colors.peach,
	t  = colors.mauve,
	v  = colors.red,     V     = colors.red,    [''] = colors.red,
}

gls.left[0] = { Mode = {
  highlight = {fg, bg},

  provider = function ()
    vim.api.nvim_command('hi GalaxyMode guifg='..mode_color[vim.fn.mode()])
    return "▌ "
  end,
}}

gls.left[1] = { FileIcon = {
	condition = condition.buffer_not_empty,
	highlight = {fileinfo.get_file_icon_color, bg},
	provider  = 'FileIcon',
  separator = ' ',
  separator_highlight = {fg,bg},
}}

gls.left[2] = { FileName = {
	condition = condition.buffer_not_empty,
	highlight = {fg, bg},
  provider = 'FileName',
}}

gls.right[4] = { LineInfo = {
	highlight = {colors.blue, bg},

	provider = function ()
		local cursor = vim.api.nvim_win_get_cursor(0)
		return cursor[1]..'·'..vim.api.nvim_buf_line_count(0)..':'..cursor[2]..' '
	end,
}}

gls.right[5] = { FileSize = {
	condition = condition.buffer_not_empty,
	highlight = {colors.blue, bg},
  provider = 'FileSize',
}}

gls.right[6] = { DiagnosticError = {
	highlight = {colors.red, bg, 'bold'},

	provider = function ()
		local icon = icons.error .. ' '
    local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[7] = { DiagnosticWarn = {
	highlight = {colors.yellow, bg, 'bold'},

	provider = function ()
		local icon = icons.warningTriangle .. ' '
    local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[8] = { DiagnosticHint = {
	highlight = {colors.blue, bg, 'bold'},

	provider = function ()
		local icon = icons.lightbulbOutline .. ' '
    local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.right[9] = { DiagnosticInfo = {
	highlight = {colors.sky, bg, 'bold'},
  separator = '',

	provider = function ()
		local icon = icons.info .. ' '
    local count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

		if count == 0 then
			return
		else
			return icon..count..' '
		end
	end,
}}

gls.short_line_left[0] = { FileIcon = {
	condition = condition.buffer_not_empty,
	highlight = {fileinfo.get_file_icon_color, bg},
	provider  = 'FileIcon',
  separator = ' '
}}

gls.short_line_left[1] = { FileName = {
	condition = condition.buffer_not_empty,
	highlight = {fg, bg},
	provider  = 'FileName',
}}

gls.short_line_right[1] = { LineInfo = {
	highlight = {fg, bg},

	provider = function ()
		local cursor = vim.api.nvim_win_get_cursor(0)

		return cursor[1]..'·'..vim.api.nvim_buf_line_count(0)..':'..cursor[2]..' '
	end,
}}
