local M = {}
local getChatId = function(chat_id)
  local chat = {}
  local chat_id = tostring(chat_id)
  if chat_id:match("^-100") then
    local channel_id = chat_id:gsub("-100", "")
    chat = {ID = channel_id, type = "channel"}
  else
    local group_id = chat_id:gsub("-", "")
    chat = {ID = group_id, type = "group"}
  end
  return chat
end
local getInputMessageContent = function(file, filetype, caption)
  if file:match("/") then
    infile = {
      ID = "InputFileLocal",
      path_ = file
    }
  elseif file:match("^%d+$") then
    infile = {
      ID = "InputFileId",
      id_ = file
    }
  else
    infile = {
      ID = "InputFilePersistentId",
      persistent_id_ = file
    }
  end
  local inmsg = {}
  local filetype = filetype:lower()
  if filetype == "animation" then
    inmsg = {
      ID = "InputMessageAnimation",
      animation_ = infile,
      caption_ = caption
    }
  elseif filetype == "audio" then
    inmsg = {
      ID = "InputMessageAudio",
      audio_ = infile,
      caption_ = caption
    }
  elseif filetype == "document" then
    inmsg = {
      ID = "InputMessageDocument",
      document_ = infile,
      caption_ = caption
    }
  elseif filetype == "photo" then
    inmsg = {
      ID = "InputMessagePhoto",
      photo_ = infile,
      caption_ = caption
    }
  elseif filetype == "sticker" then
    inmsg = {
      ID = "InputMessageSticker",
      sticker_ = infile,
      caption_ = caption
    }
  elseif filetype == "video" then
    inmsg = {
      ID = "InputMessageVideo",
      video_ = infile,
      caption_ = caption
    }
  elseif filetype == "voice" then
    inmsg = {
      ID = "InputMessageVoice",
      voice_ = infile,
      caption_ = caption
    }
  end
  return inmsg
end
local getParseMode = function(parse_mode)
  if parse_mode then
    local mode = parse_mode:lower()
    if mode == "markdown" or mode == "md" then
      P = {
        ID = "TextParseModeMarkdown"
      }
    elseif mode == "html" then
      P = {
        ID = "TextParseModeHTML"
      }
    end
  end
  return P
end
local getAuthState = function()
  tdcli_function({
    ID = "GetAuthState"
  }, dl_cb, nil)
end
M.getAuthState = getAuthState
local setAuthPhoneNumber = function(phone_number, allow_flash_call, is_current_phone_number)
  tdcli_function({
    ID = "SetAuthPhoneNumber",
    phone_number_ = phone_number,
    allow_flash_call_ = allow_flash_call,
    is_current_phone_number_ = is_current_phone_number
  }, dl_cb, nil)
end
M.setAuthPhoneNumber = setAuthPhoneNumber
local resendAuthCode = function()
  tdcli_function({
    ID = "ResendAuthCode"
  }, dl_cb, nil)
end
M.resendAuthCode = resendAuthCode
local checkAuthCode = function(code, first_name, last_name)
  tdcli_function({
    ID = "CheckAuthCode",
    code_ = code,
    first_name_ = first_name,
    last_name_ = last_name
  }, dl_cb, nil)
end
M.checkAuthCode = checkAuthCode
local checkAuthPassword = function(password)
  tdcli_function({
    ID = "CheckAuthPassword",
    password_ = password
  }, dl_cb, nil)
end
M.checkAuthPassword = checkAuthPassword
local requestAuthPasswordRecovery = function()
  tdcli_function({
    ID = "RequestAuthPasswordRecovery"
  }, dl_cb, nil)
end
M.requestAuthPasswordRecovery = requestAuthPasswordRecovery
local recoverAuthPassword = function(recovery_code)
  tdcli_function({
    ID = "RecoverAuthPassword",
    recovery_code_ = recovery_code
  }, dl_cb, nil)
end
M.recoverAuthPassword = recoverAuthPassword
local resetAuth = function(force)
  tdcli_function({
    ID = "ResetAuth",
    force_ = force or nil
  }, dl_cb, nil)
end
M.resetAuth = resetAuth
local checkAuthBotToken = function(token)
  tdcli_function({
    ID = "CheckAuthBotToken",
    token_ = token
  }, dl_cb, nil)
end
M.checkAuthBotToken = checkAuthBotToken
local getPasswordState = function()
  tdcli_function({
    ID = "GetPasswordState"
  }, dl_cb, nil)
end
M.getPasswordState = getPasswordState
local setPassword = function(old_password, new_password, new_hint, set_recovery_email, new_recovery_email)
  tdcli_function({
    ID = "SetPassword",
    old_password_ = old_password,
    new_password_ = new_password,
    new_hint_ = new_hint,
    set_recovery_email_ = set_recovery_email,
    new_recovery_email_ = new_recovery_email
  }, dl_cb, nil)
end
M.setPassword = setPassword
local getRecoveryEmail = function(password)
  tdcli_function({
    ID = "GetRecoveryEmail",
    password_ = password
  }, dl_cb, nil)
end
M.getRecoveryEmail = getRecoveryEmail
local setRecoveryEmail = function(password, new_recovery_email)
  tdcli_function({
    ID = "SetRecoveryEmail",
    password_ = password,
    new_recovery_email_ = new_recovery_email
  }, dl_cb, nil)
end
M.setRecoveryEmail = setRecoveryEmail
local requestPasswordRecovery = function()
  tdcli_function({
    ID = "RequestPasswordRecovery"
  }, dl_cb, nil)
end
M.requestPasswordRecovery = requestPasswordRecovery
local recoverPassword = function(recovery_code)
  tdcli_function({
    ID = "RecoverPassword",
    recovery_code_ = tostring(recovery_code)
  }, dl_cb, nil)
end
M.recoverPassword = recoverPassword
local getMe = function()
  tdcli_function({ID = "GetMe"}, dl_cb, nil)
end
M.getMe = getMe
local getUser = function(user_id)
  tdcli_function({ID = "GetUser", user_id_ = user_id}, dl_cb, nil)
end
M.getUser = getUser
local getUserFull = function(user_id)
  tdcli_function({
    ID = "GetUserFull",
    user_id_ = user_id
  }, dl_cb, nil)
end
M.getUserFull = getUserFull
local getGroup = function(group_id)
  tdcli_function({
    ID = "GetGroup",
    group_id_ = getChatId(group_id).ID
  }, dl_cb, nil)
end
M.getGroup = getGroup
local getGroupFull = function(group_id)
  tdcli_function({
    ID = "GetGroupFull",
    group_id_ = getChatId(group_id).ID
  }, dl_cb, nil)
end
M.getGroupFull = getGroupFull
local getChannel = function(channel_id)
  tdcli_function({
    ID = "GetChannel",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
M.getChannel = getChannel
local getChannelFull = function(channel_id)
  tdcli_function({
    ID = "GetChannelFull",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
M.getChannelFull = getChannelFull
local getChat = function(chat_id)
  tdcli_function({ID = "GetChat", chat_id_ = chat_id}, dl_cb, nil)
end
M.getChat = getChat
local getMessage = function(chat_id, message_id)
  tdcli_function({
    ID = "GetMessage",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, dl_cb, nil)
end
M.getMessage = getMessage
local getMessages = function(chat_id, message_ids)
  tdcli_function({
    ID = "GetMessages",
    chat_id_ = chat_id,
    message_ids_ = message_ids
  }, dl_cb, nil)
end
M.getMessages = getMessages
local getFile = function(file_id)
  tdcli_function({ID = "GetFile", file_id_ = file_id}, dl_cb, nil)
end
M.getFile = getFile
local getFilePersistent = function(persistent_file_id)
  tdcli_function({
    ID = "GetFilePersistent",
    persistent_file_id_ = persistent_file_id
  }, dl_cb, nil)
end
M.getFilePersistent = getFilePersistent
local getChats = function(offset_order, offset_chat_id, limit)
  if not limit or limit > 20 then
    limit = 20
  end
  tdcli_function({
    ID = "GetChats",
    offset_order_ = offset_order or 9223372036854775807,
    offset_chat_id_ = offset_chat_id or 0,
    limit_ = limit
  }, dl_cb, nil)
end
M.getChats = getChats
local searchPublicChat = function(username)
  tdcli_function({
    ID = "SearchPublicChat",
    username_ = username
  }, dl_cb, nil)
end
M.searchPublicChat = searchPublicChat
local searchPublicChats = function(username_prefix)
  tdcli_function({
    ID = "SearchPublicChats",
    username_prefix_ = username_prefix
  }, dl_cb, nil)
end
M.searchPublicChats = searchPublicChats
local searchChats = function(query, limit)
  if not limit or limit > 20 then
    limit = 20
  end
  tdcli_function({
    ID = "SearchChats",
    query_ = query,
    limit_ = limit
  }, dl_cb, nil)
end
M.searchChats = searchChats
local addRecentlyFoundChat = function(chat_id)
  tdcli_function({
    ID = "AddRecentlyFoundChat",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
M.addRecentlyFoundChat = addRecentlyFoundChat
local deleteRecentlyFoundChat = function(chat_id)
  tdcli_function({
    ID = "DeleteRecentlyFoundChat",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
M.deleteRecentlyFoundChat = deleteRecentlyFoundChat
local deleteRecentlyFoundChats = function()
  tdcli_function({
    ID = "DeleteRecentlyFoundChats"
  }, dl_cb, nil)
end
M.deleteRecentlyFoundChats = deleteRecentlyFoundChats
local getCommonChats = function(user_id, offset_chat_id, limit)
  if not limit or limit > 100 then
    limit = 100
  end
  tdcli_function({
    ID = "GetCommonChats",
    user_id_ = user_id,
    offset_chat_id_ = offset_chat_id,
    limit_ = limit
  }, dl_cb, nil)
end
M.getCommonChats = getCommonChats
local getChatHistory = function(chat_id, from_message_id, offset, limit)
  if not limit or limit > 100 then
    limit = 100
  end
  tdcli_function({
    ID = "GetChatHistory",
    chat_id_ = chat_id,
    from_message_id_ = from_message_id,
    offset_ = offset or 0,
    limit_ = limit
  }, dl_cb, nil)
end
M.getChatHistory = getChatHistory
local deleteChatHistory = function(chat_id, remove_from_chat_list)
  tdcli_function({
    ID = "DeleteChatHistory",
    chat_id_ = chat_id,
    remove_from_chat_list_ = remove_from_chat_list
  }, dl_cb, nil)
end
M.deleteChatHistory = deleteChatHistory
local searchChatMessages = function(chat_id, query, from_message_id, limit, filter)
  if not limit or limit > 100 then
    limit = 100
  end
  tdcli_function({
    ID = "SearchChatMessages",
    chat_id_ = chat_id,
    query_ = query,
    from_message_id_ = from_message_id,
    limit_ = limit,
    filter_ = {
      ID = "SearchMessagesFilter" .. filter
    }
  }, dl_cb, nil)
end
M.searchChatMessages = searchChatMessages
local searchMessages = function(query, offset_date, offset_chat_id, offset_message_id, limit)
  if not limit or limit > 100 then
    limit = 100
  end
  tdcli_function({
    ID = "SearchMessages",
    query_ = query,
    offset_date_ = offset_date,
    offset_chat_id_ = offset_chat_id,
    offset_message_id_ = offset_message_id,
    limit_ = limit
  }, dl_cb, nil)
end
M.searchMessages = searchMessages
local sendMessage = function(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)
end
M.sendMessage = sendMessage
local sendBotStartMessage = function(bot_user_id, chat_id, parameter)
  tdcli_function({
    ID = "SendBotStartMessage",
    bot_user_id_ = bot_user_id,
    chat_id_ = chat_id,
    parameter_ = parameter
  }, dl_cb, nil)
end
M.sendBotStartMessage = sendBotStartMessage
local sendInlineQueryResultMessage = function(chat_id, reply_to_message_id, disable_notification, from_background, query_id, result_id)
  tdcli_function({
    ID = "SendInlineQueryResultMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = reply_to_message_id,
    disable_notification_ = disable_notification,
    from_background_ = from_background,
    query_id_ = query_id,
    result_id_ = result_id
  }, dl_cb, nil)
end
M.sendInlineQueryResultMessage = sendInlineQueryResultMessage
local forwardMessages = function(chat_id, from_chat_id, message_ids, disable_notification)
  tdcli_function({
    ID = "ForwardMessages",
    chat_id_ = chat_id,
    from_chat_id_ = from_chat_id,
    message_ids_ = message_ids,
    disable_notification_ = disable_notification,
    from_background_ = 1
  }, dl_cb, nil)
end
M.forwardMessages = forwardMessages
local deleteMessages = function(chat_id, message_ids)
  tdcli_function({
    ID = "DeleteMessages",
    chat_id_ = chat_id,
    message_ids_ = message_ids
  }, dl_cb, nil)
end
M.deleteMessages = deleteMessages
local editMessageText = function(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function({
    ID = "EditMessageText",
    chat_id_ = chat_id,
    message_id_ = message_id,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {},
      parse_mode_ = TextParseMode
    }
  }, dl_cb, nil)
end
M.editMessageText = editMessageText
local editMessageCaption = function(chat_id, message_id, reply_markup, caption)
  tdcli_function({
    ID = "EditMessageCaption",
    chat_id_ = chat_id,
    message_id_ = message_id,
    reply_markup_ = reply_markup,
    caption_ = caption
  }, dl_cb, nil)
end
M.editMessageCaption = editMessageCaption
local editMessageReplyMarkup = function(inline_message_id, reply_markup, caption)
  tdcli_function({
    ID = "EditInlineMessageCaption",
    inline_message_id_ = inline_message_id,
    reply_markup_ = reply_markup,
    caption_ = caption
  }, dl_cb, nil)
end
M.editMessageReplyMarkup = editMessageReplyMarkup
local editInlineMessageText = function(inline_message_id, reply_markup, text, disable_web_page_preview)
  tdcli_function({
    ID = "EditInlineMessageText",
    inline_message_id_ = inline_message_id,
    reply_markup_ = reply_markup,
    input_message_content_ = {
      ID = "InputMessageText",
      text_ = text,
      disable_web_page_preview_ = disable_web_page_preview,
      clear_draft_ = 0,
      entities_ = {}
    }
  }, dl_cb, nil)
end
M.editInlineMessageText = editInlineMessageText
local editInlineMessageCaption = function(inline_message_id, reply_markup, caption)
  tdcli_function({
    ID = "EditInlineMessageCaption",
    inline_message_id_ = inline_message_id,
    reply_markup_ = reply_markup,
    caption_ = caption
  }, dl_cb, nil)
end
M.editInlineMessageCaption = editInlineMessageCaption
local editInlineMessageReplyMarkup = function(inline_message_id, reply_markup)
  tdcli_function({
    ID = "EditInlineMessageReplyMarkup",
    inline_message_id_ = inline_message_id,
    reply_markup_ = reply_markup
  }, dl_cb, nil)
end
M.editInlineMessageReplyMarkup = editInlineMessageReplyMarkup
local getInlineQueryResults = function(bot_user_id, chat_id, latitude, longitude, query, offset)
  tdcli_function({
    ID = "GetInlineQueryResults",
    bot_user_id_ = bot_user_id,
    chat_id_ = chat_id,
    user_location_ = {
      ID = "Location",
      latitude_ = latitude,
      longitude_ = longitude
    },
    query_ = query,
    offset_ = offset
  }, dl_cb, nil)
end
M.getInlineQueryResults = getInlineQueryResults
local answerInlineQuery = function(inline_query_id, is_personal, cache_time, next_offset, switch_pm_text, switch_pm_parameter)
  tdcli_function({
    ID = "AnswerInlineQuery",
    inline_query_id_ = inline_query_id,
    is_personal_ = is_personal,
    results_ = results,
    cache_time_ = cache_time,
    next_offset_ = next_offset,
    switch_pm_text_ = switch_pm_text,
    switch_pm_parameter_ = switch_pm_parameter
  }, dl_cb, nil)
end
M.answerInlineQuery = answerInlineQuery
local getCallbackQueryAnswer = function(chat_id, message_id, text, show_alert, url)
  tdcli_function({
    ID = "GetCallbackQueryAnswer",
    chat_id_ = chat_id,
    message_id_ = message_id,
    payload_ = {
      ID = "CallbackQueryAnswer",
      text_ = text,
      show_alert_ = show_alert,
      url_ = url
    }
  }, dl_cb, nil)
end
M.getCallbackQueryAnswer = getCallbackQueryAnswer
local answerCallbackQuery = function(callback_query_id, text, show_alert, url, cache_time)
  tdcli_function({
    ID = "AnswerCallbackQuery",
    callback_query_id_ = callback_query_id,
    text_ = text,
    show_alert_ = show_alert,
    url_ = url,
    cache_time_ = cache_time
  }, dl_cb, nil)
end
M.answerCallbackQuery = answerCallbackQuery
local setGameScore = function(chat_id, message_id, edit_message, user_id, score, force)
  tdcli_function({
    ID = "SetGameScore",
    chat_id_ = chat_id,
    message_id_ = message_id,
    edit_message_ = edit_message,
    user_id_ = user_id,
    score_ = score,
    force_ = force
  }, dl_cb, nil)
end
M.setGameScore = setGameScore
local setInlineGameScore = function(inline_message_id, edit_message, user_id, score, force)
  tdcli_function({
    ID = "SetInlineGameScore",
    inline_message_id_ = inline_message_id,
    edit_message_ = edit_message,
    user_id_ = user_id,
    score_ = score,
    force_ = force
  }, dl_cb, nil)
end
M.setInlineGameScore = setInlineGameScore
local getGameHighScores = function(chat_id, message_id, user_id)
  tdcli_function({
    ID = "GetGameHighScores",
    chat_id_ = chat_id,
    message_id_ = message_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
M.getGameHighScores = getGameHighScores
local getInlineGameHighScores = function(inline_message_id, user_id)
  tdcli_function({
    ID = "GetInlineGameHighScores",
    inline_message_id_ = inline_message_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
M.getInlineGameHighScores = getInlineGameHighScores
local deleteChatReplyMarkup = function(chat_id, message_id)
  tdcli_function({
    ID = "DeleteChatReplyMarkup",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, dl_cb, nil)
end
M.deleteChatReplyMarkup = deleteChatReplyMarkup
local sendChatAction = function(chat_id, action, progress)
  tdcli_function({
    ID = "SendChatAction",
    chat_id_ = chat_id,
    action_ = {
      ID = "SendMessage" .. action .. "Action",
      progress_ = progress or 100
    }
  }, dl_cb, nil)
end
M.sendChatAction = sendChatAction
local openChat = function(chat_id)
  tdcli_function({ID = "OpenChat", chat_id_ = chat_id}, dl_cb, nil)
end
M.openChat = openChat
local closeChat = function(chat_id)
  tdcli_function({ID = "CloseChat", chat_id_ = chat_id}, dl_cb, nil)
end
M.closeChat = closeChat
local viewMessages = function(chat_id, message_ids)
  tdcli_function({
    ID = "ViewMessages",
    chat_id_ = chat_id,
    message_ids_ = message_ids
  }, dl_cb, nil)
end
M.viewMessages = viewMessages
local openMessageContent = function(chat_id, message_id)
  tdcli_function({
    ID = "OpenMessageContent",
    chat_id_ = chat_id,
    message_id_ = message_id
  }, dl_cb, nil)
end
M.openMessageContent = openMessageContent
local createPrivateChat = function(user_id)
  tdcli_function({
    ID = "CreatePrivateChat",
    user_id_ = user_id
  }, dl_cb, nil)
end
M.createPrivateChat = createPrivateChat
local createGroupChat = function(group_id)
  tdcli_function({
    ID = "CreateGroupChat",
    group_id_ = getChatId(group_id).ID
  }, dl_cb, nil)
end
M.createGroupChat = createGroupChat
local createChannelChat = function(channel_id)
  tdcli_function({
    ID = "CreateChannelChat",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
M.createChannelChat = createChannelChat
local createSecretChat = function(secret_chat_id)
  tdcli_function({
    ID = "CreateSecretChat",
    secret_chat_id_ = secret_chat_id
  }, dl_cb, nil)
end
M.createSecretChat = createSecretChat
local createNewGroupChat = function(user_ids, title)
  tdcli_function({
    ID = "CreateNewGroupChat",
    user_ids_ = user_ids,
    title_ = title
  }, dl_cb, nil)
end
M.createNewGroupChat = createNewGroupChat
local createNewChannelChat = function(title, is_supergroup, about)
  tdcli_function({
    ID = "CreateNewChannelChat",
    title_ = title,
    is_supergroup_ = is_supergroup,
    about_ = about
  }, dl_cb, nil)
end
M.createNewChannelChat = createNewChannelChat
local createNewSecretChat = function(user_id)
  tdcli_function({
    ID = "CreateNewSecretChat",
    user_id_ = user_id
  }, dl_cb, nil)
end
M.createNewSecretChat = createNewSecretChat
local migrateGroupChatToChannelChat = function(chat_id)
  tdcli_function({
    ID = "MigrateGroupChatToChannelChat",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
M.migrateGroupChatToChannelChat = migrateGroupChatToChannelChat
local changeChatTitle = function(chat_id, title)
  tdcli_function({
    ID = "ChangeChatTitle",
    chat_id_ = chat_id,
    title_ = title
  }, dl_cb, nil)
end
M.changeChatTitle = changeChatTitle
local changeChatPhoto = function(chat_id, file)
  tdcli_function({
    ID = "ChangeChatPhoto",
    chat_id_ = chat_id,
    photo_ = {
      ID = "InputFileLocal",
      path_ = file
    }
  }, dl_cb, nil)
end
M.changeChatPhoto = changeChatPhoto
local changeChatDraftMessage = function(chat_id, reply_to_message_id, text, disable_web_page_preview, clear_draft, parse_mode)
  local TextParseMode = getParseMode(parse_mode)
  tdcli_function({
    ID = "ChangeChatDraftMessage",
    chat_id_ = chat_id,
    draft_message_ = {
      ID = "DraftMessage",
      reply_to_message_id_ = reply_to_message_id,
      input_message_text_ = {
        ID = "InputMessageText",
        text_ = text,
        disable_web_page_preview_ = disable_web_page_preview,
        clear_draft_ = clear_draft,
        entities_ = {},
        parse_mode_ = TextParseMode
      }
    }
  }, dl_cb, nil)
end
M.changeChatDraftMessage = changeChatDraftMessage
local addChatMember = function(chat_id, user_id, forward_limit)
  tdcli_function({
    ID = "AddChatMember",
    chat_id_ = chat_id,
    user_id_ = user_id,
    forward_limit_ = forward_limit or 50
  }, dl_cb, nil)
end
M.addChatMember = addChatMember
local addChatMembers = function(chat_id, user_ids)
  tdcli_function({
    ID = "AddChatMembers",
    chat_id_ = chat_id,
    user_ids_ = user_ids
  }, dl_cb, nil)
end
M.addChatMembers = addChatMembers
local changeChatMemberStatus = function(chat_id, user_id, status)
  tdcli_function({
    ID = "ChangeChatMemberStatus",
    chat_id_ = chat_id,
    user_id_ = user_id,
    status_ = {
      ID = "ChatMemberStatus" .. status
    }
  }, dl_cb, nil)
end
M.changeChatMemberStatus = changeChatMemberStatus
local getChatMember = function(chat_id, user_id)
  tdcli_function({
    ID = "GetChatMember",
    chat_id_ = chat_id,
    user_id_ = user_id
  }, dl_cb, nil)
end
M.getChatMember = getChatMember
local downloadFile = function(file_id)
  tdcli_function({
    ID = "DownloadFile",
    file_id_ = file_id
  }, dl_cb, nil)
end
M.downloadFile = downloadFile
local cancelDownloadFile = function(file_id)
  tdcli_function({
    ID = "CancelDownloadFile",
    file_id_ = file_id
  }, dl_cb, nil)
end
M.cancelDownloadFile = cancelDownloadFile
local exportChatInviteLink = function(chat_id)
  tdcli_function({
    ID = "ExportChatInviteLink",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
M.exportChatInviteLink = exportChatInviteLink
local checkChatInviteLink = function(link)
  tdcli_function({
    ID = "CheckChatInviteLink",
    invite_link_ = link
  }, dl_cb, nil)
end
M.checkChatInviteLink = checkChatInviteLink
local importChatInviteLink = function(invite_link)
  tdcli_function({
    ID = "ImportChatInviteLink",
    invite_link_ = invite_link
  }, dl_cb, nil)
end
M.importChatInviteLink = importChatInviteLink
local blockUser = function(user_id)
  tdcli_function({ID = "BlockUser", user_id_ = user_id}, dl_cb, nil)
end
M.blockUser = blockUser
local unblockUser = function(user_id)
  tdcli_function({
    ID = "UnblockUser",
    user_id_ = user_id
  }, dl_cb, nil)
end
M.unblockUser = unblockUser
local getBlockedUsers = function(offset, limit)
  tdcli_function({
    ID = "GetBlockedUsers",
    offset_ = offset,
    limit_ = limit
  }, dl_cb, nil)
end
M.getBlockedUsers = getBlockedUsers
local importContacts = function(phone_number, first_name, last_name, user_id)
  tdcli_function({
    ID = "ImportContacts",
    contacts_ = {
      [0] = {
        phone_number_ = tostring(phone_number),
        first_name_ = tostring(first_name),
        last_name_ = tostring(last_name),
        user_id_ = user_id
      }
    }
  }, dl_cb, nil)
end
M.importContacts = importContacts
local searchContacts = function(query, limit)
  tdcli_function({
    ID = "SearchContacts",
    query_ = query,
    limit_ = limit
  }, dl_cb, nil)
end
M.searchContacts = searchContacts
local deleteContacts = function(user_ids)
  tdcli_function({
    ID = "DeleteContacts",
    user_ids_ = user_ids
  }, dl_cb, nil)
end
M.deleteContacts = deleteContacts
local getUserProfilePhotos = function(user_id, offset, limit)
  tdcli_function({
    ID = "GetUserProfilePhotos",
    user_id_ = user_id,
    offset_ = offset,
    limit_ = limit
  }, dl_cb, nil)
end
M.getUserProfilePhotos = getUserProfilePhotos
local getStickers = function(emoji)
  tdcli_function({
    ID = "GetStickers",
    emoji_ = emoji
  }, dl_cb, nil)
end
M.getStickers = getStickers
local getStickerSets = function(only_enabled)
  tdcli_function({
    ID = "GetStickerSets",
    only_enabled_ = only_enabled
  }, dl_cb, nil)
end
M.getStickerSets = getStickerSets
local getStickerSet = function(set_id)
  tdcli_function({
    ID = "GetStickerSet",
    set_id_ = set_id
  }, dl_cb, nil)
end
M.getStickerSet = getStickerSet
local searchStickerSet = function(name)
  tdcli_function({
    ID = "SearchStickerSet",
    name_ = name
  }, dl_cb, nil)
end
M.searchStickerSet = searchStickerSet
local updateStickerSet = function(set_id, is_installed, is_enabled)
  tdcli_function({
    ID = "UpdateStickerSet",
    set_id_ = set_id,
    is_installed_ = is_installed,
    is_enabled_ = is_enabled
  }, dl_cb, nil)
end
M.updateStickerSet = updateStickerSet
local getSavedAnimations = function()
  tdcli_function({
    ID = "GetSavedAnimations"
  }, dl_cb, nil)
end
M.getSavedAnimations = getSavedAnimations
local addSavedAnimation = function(id)
  tdcli_function({
    ID = "AddSavedAnimation",
    animation_ = {
      ID = "InputFileId",
      id_ = id
    }
  }, dl_cb, nil)
end
M.addSavedAnimation = addSavedAnimation
local deleteSavedAnimation = function(id)
  tdcli_function({
    ID = "DeleteSavedAnimation",
    animation_ = {
      ID = "InputFileId",
      id_ = id
    }
  }, dl_cb, nil)
end
M.deleteSavedAnimation = deleteSavedAnimation
local getRecentInlineBots = function()
  tdcli_function({
    ID = "GetRecentInlineBots"
  }, dl_cb, nil)
end
M.getRecentInlineBots = getRecentInlineBots
local getWebPagePreview = function(message_text)
  tdcli_function({
    ID = "GetWebPagePreview",
    message_text_ = message_text
  }, dl_cb, nil)
end
M.getWebPagePreview = getWebPagePreview
local getNotificationSettings = function(scope, chat_id)
  tdcli_function({
    ID = "GetNotificationSettings",
    scope_ = {
      ID = "NotificationSettingsFor" .. scope,
      chat_id_ = chat_id or nil
    }
  }, dl_cb, nil)
end
M.getNotificationSettings = getNotificationSettings
local setNotificationSettings = function(scope, chat_id, mute_for, show_preview)
  tdcli_function({
    ID = "SetNotificationSettings",
    scope_ = {
      ID = "NotificationSettingsFor" .. scope,
      chat_id_ = chat_id or nil
    },
    notification_settings_ = {
      ID = "NotificationSettings",
      mute_for_ = mute_for,
      sound_ = "default",
      show_preview_ = show_preview
    }
  }, dl_cb, nil)
end
M.setNotificationSettings = setNotificationSettings
local setProfilePhoto = function(photo_path)
  tdcli_function({
    ID = "SetProfilePhoto",
    photo_path_ = photo_path
  }, dl_cb, nil)
end
M.setProfilePhoto = setProfilePhoto
local deleteProfilePhoto = function(profile_photo_id)
  tdcli_function({
    ID = "DeleteProfilePhoto",
    profile_photo_id_ = profile_photo_id
  }, dl_cb, nil)
end
M.deleteProfilePhoto = deleteProfilePhoto
local changeName = function(first_name, last_name)
  tdcli_function({
    ID = "ChangeName",
    first_name_ = first_name,
    last_name_ = last_name
  }, dl_cb, nil)
end
M.changeName = changeName
local changeAbout = function(about)
  tdcli_function({
    ID = "ChangeAbout",
    about_ = about
  }, dl_cb, nil)
end
M.changeAbout = changeAbout
local changeUsername = function(username)
  tdcli_function({
    ID = "ChangeUsername",
    username_ = username
  }, dl_cb, nil)
end
M.changeUsername = changeUsername
local changePhoneNumber = function(phone_number, allow_flash_call, is_current_phone_number)
  tdcli_function({
    ID = "ChangePhoneNumber",
    phone_number_ = phone_number,
    allow_flash_call_ = allow_flash_call,
    is_current_phone_number_ = is_current_phone_number
  }, dl_cb, nil)
end
M.changePhoneNumber = changePhoneNumber
local resendChangePhoneNumberCode = function()
  tdcli_function({
    ID = "ResendChangePhoneNumberCode"
  }, dl_cb, nil)
end
M.resendChangePhoneNumberCode = resendChangePhoneNumberCode
local checkChangePhoneNumberCode = function(code)
  tdcli_function({
    ID = "CheckChangePhoneNumberCode",
    code_ = code
  }, dl_cb, nil)
end
M.checkChangePhoneNumberCode = checkChangePhoneNumberCode
local getActiveSessions = function()
  tdcli_function({
    ID = "GetActiveSessions"
  }, dl_cb, nil)
end
M.getActiveSessions = getActiveSessions
local terminateSession = function(session_id)
  tdcli_function({
    ID = "TerminateSession",
    session_id_ = session_id
  }, dl_cb, nil)
end
M.terminateSession = terminateSession
local terminateAllOtherSessions = function()
  tdcli_function({
    ID = "TerminateAllOtherSessions"
  }, dl_cb, nil)
end
M.terminateAllOtherSessions = terminateAllOtherSessions
local toggleGroupEditors = function(group_id, anyone_can_edit)
  tdcli_function({
    ID = "ToggleGroupEditors",
    group_id_ = getChatId(group_id).ID,
    anyone_can_edit_ = anyone_can_edit
  }, dl_cb, nil)
end
M.toggleGroupEditors = toggleGroupEditors
local changeChannelUsername = function(channel_id, username)
  tdcli_function({
    ID = "ChangeChannelUsername",
    channel_id_ = getChatId(channel_id).ID,
    username_ = username
  }, dl_cb, nil)
end
M.changeChannelUsername = changeChannelUsername
local toggleChannelInvites = function(channel_id, anyone_can_invite)
  tdcli_function({
    ID = "ToggleChannelInvites",
    channel_id_ = getChatId(channel_id).ID,
    anyone_can_invite_ = anyone_can_invite
  }, dl_cb, nil)
end
M.toggleChannelInvites = toggleChannelInvites
local toggleChannelSignMessages = function(channel_id, sign_messages)
  tdcli_function({
    ID = "ToggleChannelSignMessages",
    channel_id_ = getChatId(channel_id).ID,
    sign_messages_ = sign_messages
  }, dl_cb, nil)
end
M.toggleChannelSignMessages = toggleChannelSignMessages
local changeChannelAbout = function(channel_id, about)
  tdcli_function({
    ID = "ChangeChannelAbout",
    channel_id_ = getChatId(channel_id).ID,
    about_ = about
  }, dl_cb, nil)
end
M.changeChannelAbout = changeChannelAbout
local pinChannelMessage = function(channel_id, message_id, disable_notification)
  tdcli_function({
    ID = "PinChannelMessage",
    channel_id_ = getChatId(channel_id).ID,
    message_id_ = message_id,
    disable_notification_ = disable_notification
  }, dl_cb, nil)
end
M.pinChannelMessage = pinChannelMessage
local unpinChannelMessage = function(channel_id)
  tdcli_function({
    ID = "UnpinChannelMessage",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
M.unpinChannelMessage = unpinChannelMessage
local reportChannelSpam = function(channel_id, user_id, message_ids)
  tdcli_function({
    ID = "ReportChannelSpam",
    channel_id_ = getChatId(channel_id).ID,
    user_id_ = user_id,
    message_ids_ = message_ids
  }, dl_cb, nil)
end
M.reportChannelSpam = reportChannelSpam
local getChannelMembers = function(channel_id, offset, filter, limit)
  if not limit or limit > 200 then
    limit = 200
  end
  tdcli_function({
    ID = "GetChannelMembers",
    channel_id_ = getChatId(channel_id).ID,
    filter_ = {
      ID = "ChannelMembers" .. filter
    },
    offset_ = offset,
    limit_ = limit
  }, dl_cb, nil)
end
M.getChannelMembers = getChannelMembers
local deleteChannel = function(channel_id)
  tdcli_function({
    ID = "DeleteChannel",
    channel_id_ = getChatId(channel_id).ID
  }, dl_cb, nil)
end
M.deleteChannel = deleteChannel
local getSupportUser = function()
  tdcli_function({
    ID = "GetSupportUser"
  }, dl_cb, nil)
end
M.getSupportUser = getSupportUser
local getWallpapers = function()
  tdcli_function({
    ID = "GetWallpapers"
  }, dl_cb, nil)
end
M.getWallpapers = getWallpapers
local registerDevice = function()
  tdcli_function({
    ID = "RegisterDevice"
  }, dl_cb, nil)
end
M.registerDevice = registerDevice
local getDeviceTokens = function()
  tdcli_function({
    ID = "GetDeviceTokens"
  }, dl_cb, nil)
end
M.getDeviceTokens = getDeviceTokens
local setPrivacy = function(key, rules, user_ids)
  if user_ids and rules:match("Allow") then
    rule = "AllowUsers"
  elseif user_ids and rules:match("Disallow") then
    rule = "DisallowUsers"
  end
  tdcli_function({
    ID = "SetPrivacy",
    key_ = {
      ID = "PrivacyKey" .. key
    },
    rules_ = {
      ID = "PrivacyRules",
      rules_ = {
        [0] = {
          ID = "PrivacyRule" .. rules
        },
        {
          ID = "PrivacyRule" .. rule,
          user_ids_ = user_ids
        }
      }
    }
  }, dl_cb, nil)
end
M.setPrivacy = setPrivacy
local getPrivacy = function(key)
  tdcli_function({
    ID = "GetPrivacy",
    key_ = {
      ID = "PrivacyKey" .. key
    }
  }, dl_cb, nil)
end
M.getPrivacy = getPrivacy
local getOption = function(name)
  tdcli_function({ID = "GetOption", name_ = name}, dl_cb, nil)
end
M.getOption = getOption
local setOption = function(name, option, value)
  tdcli_function({
    ID = "SetOption",
    name_ = name,
    value_ = {
      ID = "Option" .. option,
      value_ = value
    }
  }, dl_cb, nil)
end
M.setOption = setOption
local changeAccountTtl = function(days)
  tdcli_function({
    ID = "ChangeAccountTtl",
    ttl_ = {ID = "AccountTtl", days_ = days}
  }, dl_cb, nil)
end
M.changeAccountTtl = changeAccountTtl
local getAccountTtl = function()
  tdcli_function({
    ID = "GetAccountTtl"
  }, dl_cb, nil)
end
M.getAccountTtl = getAccountTtl
local deleteAccount = function(reason)
  tdcli_function({
    ID = "DeleteAccount",
    reason_ = reason
  }, dl_cb, nil)
end
M.deleteAccount = deleteAccount
local getChatReportSpamState = function(chat_id)
  tdcli_function({
    ID = "GetChatReportSpamState",
    chat_id_ = chat_id
  }, dl_cb, nil)
end
M.getChatReportSpamState = getChatReportSpamState
local changeChatReportSpamState = function(chat_id, is_spam_chat)
  tdcli_function({
    ID = "ChangeChatReportSpamState",
    chat_id_ = chat_id,
    is_spam_chat_ = is_spam_chat
  }, dl_cb, nil)
end
M.changeChatReportSpamState = changeChatReportSpamState
local setBotUpdatesStatus = function(pending_update_count, error_message)
  tdcli_function({
    ID = "SetBotUpdatesStatus",
    pending_update_count_ = pending_update_count,
    error_message_ = error_message
  }, dl_cb, nil)
end
M.setBotUpdatesStatus = setBotUpdatesStatus
local setAlarm = function(seconds)
  tdcli_function({ID = "SetAlarm", seconds_ = seconds}, dl_cb, nil)
end
M.setAlarm = setAlarm
local account_change_username = function(username)
  changeUsername(username)
end
M.account_change_username = account_change_username
local account_change_name = function(first_name, last_name)
  changeName(first_name, last_name)
end
M.account_change_name = account_change_name
local account_change_photo = function(photo_path)
  setProfilePhoto(photo_path)
end
M.account_change_photo = account_change_photo
local add_contact = function(phone, first_name, last_name, user_id)
  importContacts(phone, first_name, last_name, user_id)
end
M.add_contact = add_contact
local block_user = function(user_id)
  blockUser(user_id)
end
M.block_user = block_user
local channel_get_admins = function(channel_id)
  getChannelMembers(channel_id, 0, "Administrators")
end
M.channel_get_admins = channel_get_admins
local channel_get_bots = function(channel_id)
  getChannelMembers(channel_id, 0, "Bots")
end
M.channel_get_bots = channel_get_bots
local channel_get_kicked = function(channel_id)
  getChannelMembers(channel_id, 0, "Kicked")
end
M.channel_get_kicked = channel_get_kicked
local channel_get_members = function(channel_id)
  getChannelMembers(channel_id, 0, "Recent")
end
M.channel_get_members = channel_get_members
local channel_change_about = function(channel_id, about)
  changeChannelAbout(channel_id, about)
end
M.channel_change_about = channel_change_about
local channel_change_username = function(channel_id, username)
  changeChannelUsername(channel_id, username)
end
M.channel_change_username = channel_change_username
local channel_edit = function(channel_id, param, enabled)
  if param:lower() == "sign" then
    toggleChannelSignMessages(channel_id, enabled)
  elseif param:lower() == "invites" then
    toggleChannelInvites(channel_id, enabled)
  end
end
M.channel_edit = channel_edit
local chat_add_user = function(chat_id, user_id, msgs_to_forward)
  addChatMember(chat_id, user_id, msgs_to_forward)
end
M.chat_add_user = chat_add_user
local chat_change_photo = function(chat_id, file)
  changeChatPhoto(chat_id, file)
end
M.chat_change_photo = chat_change_photo
local chat_change_title = function(chat_id, title)
  changeChatTitle(chat_id, title)
end
M.chat_change_title = chat_change_title
local chat_change_role = function(chat_id, user_id, role)
  changeChatMemberStatus(chat_id, user_id, role)
end
M.chat_change_role = chat_change_role
local chat_del_user = function(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Kicked")
end
M.chat_del_user = chat_del_user
local chat_info = function(chat_id)
  getChat(chat_id)
end
M.chat_info = chat_info
local chat_join = function(invite_link)
  importChatInviteLink(invite_link)
end
M.chat_join = chat_join
local chat_leave = function(chat_id, user_id)
  changeChatMemberStatus(chat_id, user_id, "Left")
end
M.chat_leave = chat_leave
local chat_check_invite_link = function(invite_link)
  checkChatInviteLink(invite_link)
end
M.chat_check_invite_link = chat_check_invite_link
local chat_create_broadcast = function(title, about)
  createNewChannelChat(title, 0, about)
end
M.chat_create_broadcast = chat_create_broadcast
local chat_create_group = function(title, user_ids)
  createNewGroupChat(title, user_ids)
end
M.chat_create_group = chat_create_group
local chat_create_supergroup = function(title, about)
  createNewChannelChat(title, 1, about)
end
M.chat_create_supergroup = chat_create_supergroup
local chat_export_invite_link = function(chat_id)
  exportChatInviteLink(chat_id)
end
M.chat_export_invite_link = chat_export_invite_link
local chat_import_invite_link = function(invite_link)
  importChatInviteLink(invite_link)
end
M.chat_import_invite_link = chat_import_invite_link
local contact_list = function(limit)
  searchContacts("", limit)
end
M.contact_list = contact_list
local contact_delete = function(user_ids)
  deleteContacts(user_ids)
end
M.contact_delete = contact_delete
local delete_msg = function(chat_id, message_ids)
  deleteMessages(chat_id, message_ids)
end
M.delete_msg = delete_msg
local dialog_list = function(limit)
  searchChats("", limit)
end
M.dialog_list = dialog_list
local fwd = function(chat_id, from_chat_id, message_ids)
  forwardMessages(chat_id, from_chat_id, message_ids, 0)
end
M.fwd = fwd
local get_message = function(chat_id, message_id)
  getMessage(chat_id, message_id)
end
M.get_message = get_message
local group_upgrade = function(chat_id)
  migrateGroupChatToChannelChat(chat_id)
end
M.group_upgrade = group_upgrade
local history = function(chat_id, limit, offset)
  getChatHistory(chat_id, 0, offset, limit)
end
M.history = history
local mark_read = function(chat_id, message_ids)
  viewMessages(chat_id, message_ids)
end
M.mark_read = mark_read
local msg = function(chat_id, text)
  sendMessage(chat_id, 0, 0, text, 1)
end
M.msg = msg
local mute = function(chat_id, mute_for)
  setNotificationSettings("Chat", chat_id, mute_for or 60, 0)
end
M.mute = mute
local pin_message = function(channel_id, message_id, disable_notification)
  pinChannelMessage(channel_id, message_id, disable_notification)
end
M.pin_message = pin_message
local push_button = function(message, button_id)
end
M.push_button = push_button
local resolve_username = function(username)
  tdcli.searchChats(username, 20)
end
M.resolve_username = resolve_username
local reply = function(chat_id, msg_id, text)
  sendMessage(chat_id, msg_id, 0, text, 1)
end
M.reply = reply
local reply_file = function(chat_id, msg_id, type, file, caption)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = msg_id,
    disable_notification_ = 0,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = getInputMessageContent(file, type, caption)
  }, dl_cb, nil)
end
M.reply_file = reply_file
local reply_fwd = function(msg_id, fwd_id)
end
M.reply_fwd = reply_fwd
local reply_location = function(chat_id, msg_id, latitude, longitude)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = msg_id,
    disable_notification_ = 0,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageLocation",
      location_ = {
        ID = "Location",
        latitude_ = latitude,
        longitude_ = longitude
      }
    }
  }, dl_cb, nil)
end
M.reply_location = reply_location
local search = function(chat_id, query, from_message_id, limit, filter)
  searchChatMessages(chat_id, query, from_message_id, limit, filter)
end
M.search = search
local send_file = function(chat_id, type, file, caption)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = 0,
    disable_notification_ = 0,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = getInputMessageContent(file, type, caption)
  }, dl_cb, nil)
end
M.send_file = send_file
local send_location = function(chat_id, latitude, longitude)
  tdcli_function({
    ID = "SendMessage",
    chat_id_ = chat_id,
    reply_to_message_id_ = 0,
    disable_notification_ = 0,
    from_background_ = 1,
    reply_markup_ = nil,
    input_message_content_ = {
      ID = "InputMessageLocation",
      location_ = {
        ID = "Location",
        latitude_ = latitude,
        longitude_ = longitude
      }
    }
  }, dl_cb, nil)
end
M.send_location = send_location
local send_typing = function(chat_id, action, progress)
  sendChatAction(chat_id, action, progress)
end
M.send_typing = send_typing
local start_bot = function(user_id, chat_id, data)
  sendBotStartMessage(user_id, chat_id, "start")
end
M.start_bot = start_bot
local timer = function(timeout)
  setAlarm(timeout)
end
M.timer = timer
local unblock_user = function(user_id)
  unblockUser(user_id)
end
M.unblock_user = unblock_user
local unmute = function(chat_id)
  setNotificationSettings("Chat", chat_id, 0, 1)
end
M.unmute = unmute
local blockUser = function(user_id)
  tdcli_function({ID = "BlockUser", user_id_ = user_id}, dl_cb, nil)
end
local checkChatInviteLink = function(link)
  tdcli_function({
    ID = "CheckChatInviteLink",
    invite_link_ = link
  }, dl_cb, nil)
end
M.checkChatInviteLink = checkChatInviteLink
M.blockUser = blockUser
local getInlineQueryResults = function(bot_user_id, chat_id, latitude, longitude, query, offset)
  tdcli_function({
    ID = "GetInlineQueryResults",
    bot_user_id_ = bot_user_id,
    chat_id_ = chat_id,
    user_location_ = {
      ID = "Location",
      latitude_ = latitude,
      longitude_ = longitude
    },
    query_ = query,
    offset_ = offset
  }, dl_cb, nil)
end
M.getInlineQueryResults = getInlineQueryResults
local deleteMessages = function(chat_id, message_ids)
  tdcli_function({
    ID = "DeleteMessages",
    chat_id_ = chat_id,
    message_ids_ = message_ids
  }, dl_cb, nil)
end
M.deleteMessages = deleteMessages
local changeUsername = function(username)
  tdcli_function({
    ID = "ChangeUsername",
    username_ = username
  }, dl_cb, nil)
end
M.changeUsername = changeUsername
return M


--@mafia_cli
--https://github.com/mafia-007
