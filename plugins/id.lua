
local function run(msg, matches)
  if matches[1] == 'id' then
	 pm = group[tostring(msg.chat_id_)]['id']
	 tg.sendMessage(msg.chat_id_, 0, 1,'<b>ID</b> ➣➣ ['..msg.from_id..']' , 1, 'html')
	end
    end
return {
  patterns = {
    "^[#!/](id)$"
  },
  run = run
}

--channel : @mafia_cli
