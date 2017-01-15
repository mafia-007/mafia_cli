local function addgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if not groupa then
group[tostring(msg.chat_id)] = {
        group_type = 'SuperGroup',
		by = msg.from_id,
		moderators = {},
        set_owner = member_id ,
        settings = {
		  lock_link = "no",
lock_username = "no",
lock_edit = "no",
lock_fwd = "no",
lock_spam = "no",
lock_sticker = "no",				
lock_english = "no",
lock_persian = "no",
lock_tgservice = "no",
lock_tag = "no",
lock_inline = "no",				
mute_all = "no",
mute_text = "no",				
mute_photo = "no",
mute_video = "no",
mute_voice = "no",
mute_document = "no",
mute_gif = "no",
mute_audio = "no"
                  }
      }
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup ➣➣ added', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup ➣➣ add', 1)
end
end
local function remgroup(msg)
local group = load_data('bot/group.json')
local groupa = group[tostring(msg.chat_id)]
if groupa then
group[tostring(msg.chat_id)] = nil
      save_data(_config.group.data, group)
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup ➣➣ removed', 1)
else
tg.sendMessage(msg.chat_id, msg.id_, 1, 'SuperGroup ➣➣ remove', 1)
end
end

local function run(msg, matches)
if matches[1] == 'add' and is_sudo(msg) then
addgroup(msg)
elseif matches[1] == 'rem' and is_sudo(msg) then
remgroup(msg)
end
end
return {
  patterns = {
    "^[/#!](add)$",
    "^[/#!](rem)$",
 "^!!!edit:[/#!](add)$",
    "^!!!edit:[/#!](rem)$"
  },
  run = run
}
