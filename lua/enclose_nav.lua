ENCLOSE_SYMBOL = {["("]=")", ["["]="]", ["\""]="\"", ["\'"]="\'", ["{"]="}", ["<"]=">"}
CLOSE_SYMBOL = {")", "]", "\'", "\"", "}", ">"}

function inside_list(list, value) 
	for _, v in ipairs(list) do
		if v == value then
			return true
		end
	end
	return false
end


function enclose_nav()
local function debug_print(message)
  vim.api.nvim_command("echo '" .. message .. "'")
end
	-- get the current cursor position
	local cursor_pos = vim.api.nvim_win_get_cursor(0);
	local line = vim.api.nvim_buf_get_lines(0, cursor_pos[1]-1, cursor_pos[1], false)[1]
	-- flag indicating if we are inside enclosing parens or brackets
	local inside_enclose = nil
	-- iterate over the characters in the line
	for i = cursor_pos[2] + 1, #line do
		local char = line:sub(i, i)
		if inside_list(CLOSE_SYMBOL, char) then
			-- move the cursor to the position of the closing token 
			vim.api.nvim_win_set_cursor(0, {cursor_pos[1], i})
			break
		end
	end
	-- for i = cursor_pos[2], 1, -1 do
	-- 	local char = line:sub(i, i)
	-- 	-- local message = string.format("%s", char)
	-- 	-- debug_print(message)
	-- 	--char == "(" or char == "["
	-- 	if ENCLOSE_SYMBOL[char] ~= nil  then
	-- 		inside_enclose = char
	-- 		break
	-- 	end
		-- if inside_enclose then
		-- if  char == ")" or char == "]" then
		-- 	-- move the cursor to the position of the closing parenthesis or bracket
		-- 	vim.api.nvim_win_set_cursor(0, {cursor_pos[1], i})
		-- end
		-- end
	-- end
	--
	-- if inside_enclose == nil then
	-- 	return
	-- end
	--
	-- local target_char = ENCLOSE_SYMBOL[inside_enclose]
	-- if target_char == nil then
	-- 	return
	-- end
	-- debug_print(target_char)

end


