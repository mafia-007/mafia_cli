local function run(msg, matches)
	local like = function(arg, data)
	 tdcli_function({ID = "SendInlineQueryResultMessage",chat_id_ = msg.chat_id_,reply_to_message_id_ = msg.id_,disable_notification_ = 0,from_background_ = 1,query_id_ = data.inline_query_id_,result_id_ = data.results_[0].id_}, dl_cb, nil)
	end
	 tdcli_function({ID = "GetInlineQueryResults",bot_user_id_ = 190601014,chat_id_ = msg.chat_id_,user_location_ = {ID = "Location",latitude_ = 0,longitude_ = 0},query_ = matches[2],offset_ = 0}, like, nil)
end
return {
  patterns = {
    "^[#!/](like) (.*)$"
  },
  run = run
}


--https://github.com/mafia-007/mafia_cli
