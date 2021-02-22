killsay_category = menu:add_category("kill say")
killsay_enabled = menu:add_checkbox("enabled", killsay_category)

local trash_talk_table = {
	'?',
	'ez'
}

local function get_table_length(data)
  if type(data) ~= 'table' then
    return 0
  end
  local count = 0
  for _ in pairs(data) do
    count = count + 1
  end
  return count
end

local num_quotes = get_table_length(trash_talk_table)
local last_sent = 0

local function on_kda_updated(kill, death, assist)
	if kill and menu:get_value(killsay_enabled) == 1 then
		game:send_chat("/all " .. trash_talk_table[math.random(num_quotes)])
	end
end

client:set_event_callback("on_kda_updated", on_kda_updated)