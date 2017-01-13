local function run(msg, matches)
tg.sendMessage(msg.chat_id, 0, 0,  "<b>online</b>", 0)
end
return {
  patterns = {
	"^[!#/]([Mm][Aa][Ff][Ii][Aa])$",
  },
  run = run
}

--@mafia_cli
--https://github.com/mafia-007
