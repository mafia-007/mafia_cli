local function run(msg, matches)
BOT = 1324354635 -- your bot id
-- write with @dev_mohammad
if matches[1] == "leave" and is_sudo(msg) then
		redis:set('lve'..msg.chat_id,'yes')
		text = "\n<b>/yes\n\n/no</b>"
		tg.sendMessage(msg.chat_id, 0, 0, text, 0, 'html')
		elseif matches[1] == "yes" and redis:get('leve'..msg.chat_id)=="yes" then
tg.changeChatMemberStatus(msg.chat_id, 1324354635, "Left")
	redis:set('lve'..msg.chat_id_,'no')
elseif matches[1] == "no" and redis:get('leave'..msg.chat_id)=="yes" then
	redis:set('lve'..msg.chat_id_,'no')
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


