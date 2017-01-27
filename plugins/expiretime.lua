
local function pre_process(msg)
 msg.text = msg.content_.text
	local timetoexpire = 'unknown'
	local expiretime = redis:hget ('expiretime', msg.chat_id_)
	local now = tonumber(os.time())
	if expiretime then    
		timetoexpire = math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1
		if tonumber("0") > tonumber(timetoexpire) and not is_sudo(msg) then
		if msg.text:match('/') then
			return tg.sendMessage(msg.chat_id_, 0, 1, '<b>ExpireTime Ended</b>', 1, 'html')
		else
			return
		end
	end
	if tonumber(timetoexpire) == 0 then
		if redis:hget('expires0',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, '<b>Only 0 Days Please Extend HureyUp</b>', 1, 'html')
		redis:hset('expires0',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 1 then
		if redis:hget('expires1',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, '<b>Only And Only 1 Days Please Extend</b>', 1, 'html')
		redis:hset('expires1',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 2 then
		if redis:hget('expires2',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, 'Only 2 Days Please Extend</b>', 1, 'html')
		redis:hset('expires2',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 3 then
		if redis:hget('expires3',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, '<b>Only 3 Days Please Extend</b>', 1, 'html')
		redis:hset('expires3',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 4 then
		if redis:hget('expires4',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, '<b>Only 4 Days Please Extend</b>', 1, 'html')
		redis:hset('expires4',msg.chat_id_,'5')
	end
	if tonumber(timetoexpire) == 5 then
		if redis:hget('expires5',msg.chat_id_) then end
		tg.sendMessage(msg.chat_id_, 0, 1, '<b>Only 5 Days Please Extend</b>', 1, 'html')
		redis:hset('expires5',msg.chat_id_,'5')
	end
end

end
function run(msg, matches)
	if matches[1]:lower() == 'setexpire' then
		if not is_sudo(msg) then return end
		local time = os.time()
		local buytime = tonumber(os.time())
		local timeexpire = tonumber(buytime) + (tonumber(matches[2]) * 86400)
		redis:hset('expiretime',msg.chat_id_,timeexpire)
		return "<b>Expire Time Set(</b> "..matches[2].. " <b>)Days</b> "
	end
	if matches[1]:lower() == 'expire' then
		local expiretime = redis:hget ('expiretime', msg.chat_id_)
		if not expiretime then return 'Unlimited' else
			local now = tonumber(os.time())
			return (math.floor((tonumber(expiretime) - tonumber(now)) / 86400) + 1) .. "Days"
		end
	end

end
return {
  patterns = {
    "^[!/]([Ss]etexpire) (.*)$",
	"^[!/]([Ee]xpire)$",
  },
  run = run,
  pre_process = pre_process
}


--channel : @mafia_cli
