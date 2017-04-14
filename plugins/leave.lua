local function run(msg, matches)
BOT = 123456789 -- your bot id
if matches[1] == "leave" and is_sudo(msg) then
		redis:set('leave'..msg.chat_id,'yes')
		text = "\n/yes\n\n/no"
		tg.sendMessage(msg.chat_id, 0, 0, text, 0, 'html')
		elseif matches[1] == "yes" and redis:get('leave'..msg.chat_id)=="yes" then
tg.changeChatMemberStatus(msg.chat_id, 123456789, "Left") -- your bot id
	redis:set('leave'..msg.chat_id_,'no')
elseif matches[1] == "no" and redis:get('leave'..msg.chat_id)=="yes" then
	redis:set('leave'..msg.chat_id_,'no')
text = "End"
tg.sendMessage(msg.chat_id, 0, 0, text, 0, 'html')
end
end
return{
patterns = {
"^[!#/](leave)$",
"^[!#/](yes)$",
"^[!#/](no)$"
},
run = run
}


