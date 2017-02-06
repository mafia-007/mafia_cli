local function lock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    pm = '<b>Link</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Link</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
    pm = '<b>username</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>username</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'yes' then
    pm = '<b>Edite</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_edit'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Edite</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'yes' then
    pm = '<b>Fwd</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_fwd'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Fwd</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
    pm = '<b>Spem</b> <b>➣➣</b> <b>lock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Spem</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    pm = '<b>sticker</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>sticker</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    pm = '<b>english</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>english</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'yes' then
    pm = '<b>persian</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_persian'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>persian</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
    pm = '<b>tgservice</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>tgservice</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'yes' then
    pm = '<b>tag</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_tag'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>tag</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'yes' then
    pm = '<b>Inline</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_inline'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Inline</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_community(msg, target)
local group = load_data('bot/group.json')
  local group_community_lock = group[tostring(target)]['settings']['lock_community']
  if group_community_lock == 'yes' then
    pm = '<b>Community</b> <b>➣➣</b> <b>lock</b>'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_community'] = 'yes'
    save_data(_config.group.data, group)
    pm = '<b>Community</b> <b>➣➣</b> <b>locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
------------------
local function unlock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    pm = '<b>Link</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Link</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
    pm = '<b>username</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>username</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'no' then
    pm = '<b>Edite</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_edit'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Edite</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'no' then
    pm = '<b>Fwd</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_fwd'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Fwd</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
    pm = '<b>Spam</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Spam</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    pm = '<b>sticker</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>sticker</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    pm = '<b>english</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>english</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'no' then
    pm = '<b>persian</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_persian'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>persian</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
    pm = '<b>tgservice</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>tgservice</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'no' then
    pm = '<b>tag</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tag'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>tag</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'no' then
    pm = '<b>Inline</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_inline'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Inline</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_community(msg, target)
local group = load_data('bot/group.json')
  local group_community_lock = group[tostring(target)]['settings']['lock_community']
  if group_community_lock == 'no' then
    pm = '<b>Community</b> <b>➣➣</b> <b>unlock</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_community'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Community</b> <b>➣➣</b> <b>unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
----------

local function mute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'yes' then
    pm = '<b>All</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>All</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'no' then
    pm = '<b>All</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>All</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_text_group(msg, target)
local group = load_data('bot/group.json')
  local mute_text = group[tostring(target)]['settings']['mute_text']
  if mute_text  == 'yes' then
    pm = '<b>Text</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_text'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Text</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_text_group(msg, target)
local group = load_data('bot/group.json')
  local mute_text = group[tostring(target)]['settings']['mute_text']
  if mute_text  == 'no' then
    pm = '<b>Text</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_text'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Text</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'yes' then
    pm = '<b>Photo</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Photo</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'no' then
    pm = '<b>Photo</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Photo</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'yes' then
    pm = '<b>Video</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Video</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'no' then
    pm = '<b>Video</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Video</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'yes' then
    pm = '<b>Gifs</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Gifs</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'no' then
    pm = '<b>Gifs</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Gifs</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'yes' then
    pm = '<b>Voice</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Voice</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'no' then
    pm = '<b>Voice</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Voice</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'yes' then
    pm = '<b>Audio</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Audio</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'no' then
    pm = '<b>Audio</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Audio</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'yes' then
    pm = '<b>Documents</b> ➣➣ <b>mute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Documents</b> ➣➣ <b>muted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'no' then
    pm = '<b>Documents</b> ➣➣ <b>unmute</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Documents</b> ➣➣ <b>unmuted</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end

local function group_settings(msg, target)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b> \n <code>→→→→→→→→→→→→</code>'
--pm = pm..'\n <code>→→→→→→→→→→→→</code>'
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Links</b> <code>»</code> '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>User</b> <code>»</code> '..group[tostring(target)]['settings']['lock_username']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Edit</b> <code>»</code> '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Fwd</b> <code>»</code> '..group[tostring(target)]['settings']['lock_fwd']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Spam</b> <code>»</code> '..group[tostring(target)]['settings']['lock_spam']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Sticker</b> <code>»</code>'..group[tostring(target)]['settings']['lock_sticker']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Eng</b> <code>»</code> '..group[tostring(target)]['settings']['lock_english']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Far</b> <code>»</code> '..group[tostring(target)]['settings']['lock_persian']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Tg</b> <code>»</code> '..group[tostring(target)]['settings']['lock_tgservice']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Tag</b> <code>»</code> '..group[tostring(target)]['settings']['lock_tag']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Inline</b> <code>»</code> '..group[tostring(target)]['settings']['lock_inline']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Commun</b> <code>»</code> '..group[tostring(target)]['settings']['lock_community']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>All</b> <code>»</code> '..group[tostring(target)]['settings']['mute_all']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Text</b> <code>»</code> '..group[tostring(target)]['settings']['mute_text']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Photo</b> <code>»</code> '..group[tostring(target)]['settings']['mute_photo']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Video</b> <code>»</code> '..group[tostring(target)]['settings']['mute_video']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Voice</b> <code>»</code> '..group[tostring(target)]['settings']['mute_voice']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Doc</b> <code>»</code> '..group[tostring(target)]['settings']['mute_document']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Audio</b> <code>»</code> '..group[tostring(target)]['settings']['mute_audio']..''
pm = pm..'\n  <b>Lock</b> <code>➣</code> <b>Gif</b> <code>»</code> '..group[tostring(target)]['settings']['mute_gif']..''
--pm = '<code>→→→→→→→→→→→→</code>'
pm = pm..'\n <code>→→→→→→→→→→→→</code> \n <b> mafia_cli </b>'

tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if addgroup and is_momod(msg) then
if matches[1] == 'settings'  then
group_settings(msg, msg.chat_id)
elseif matches[1] == 'lock' then
if matches[2] == 'links' then
lock_group_links(msg, msg.chat_id)
elseif matches[2] == 'edit' then
lock_group_edit(msg, msg.chat_id)
elseif matches[2] == 'fwd' then
lock_group_fwd(msg, msg.chat_id)
elseif matches[2] == 'username' then
lock_group_username(msg, msg.chat_id)
elseif matches[2] == 'spam' then
lock_group_spam(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
lock_group_sticker(msg, msg.chat_id)
elseif matches[2] == 'english' then
lock_group_english(msg, msg.chat_id)
elseif matches[2] == 'persian' then
lock_group_persian(msg, msg.chat_id)
elseif matches[2] == 'tgservice' then
lock_group_tgservice(msg, msg.chat_id)
elseif matches[2] == 'tag' then
lock_group_tag(msg, msg.chat_id)
elseif matches[2] == 'inline' then
lock_group_inline(msg, msg.chat_id)
elseif matches[2] == 'community' then
lock_group_community(msg, msg.chat_id)
end
elseif matches[1] == 'unlock' then
if matches[2] == 'links' then
unlock_group_links(msg, msg.chat_id,group )
elseif matches[2] == 'edit' then
unlock_group_edit(msg, msg.chat_id)
elseif matches[2] == 'fwd' then
unlock_group_fwd(msg, msg.chat_id)
elseif matches[2] == 'username' then
unlock_group_username(msg, msg.chat_id)
elseif matches[2] == 'spam' then
unlock_group_spam(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
unlock_group_sticker(msg, msg.chat_id)
elseif matches[2] == 'english' then
unlock_group_english(msg, msg.chat_id)
elseif matches[2] == 'persian' then
unlock_group_persian(msg, msg.chat_id)
elseif matches[2] == 'tag' then
unlock_group_tag(msg, msg.chat_id)
elseif matches[2] == 'tgservice' then
unlock_group_tgservice(msg, msg.chat_id)
elseif matches[2] == 'inline' then
unlock_group_inline(msg, msg.chat_id,group )
elseif matches[2] == 'community' then
unlock_group_community(msg, msg.chat_id)
end
elseif matches[1] == 'mute' or matches[1] == 'lock' then
if matches[2] == 'all' then
mute_all_group(msg, msg.chat_id)
elseif matches[2] == 'text' then
mute_text_group(msg, msg.chat_id)
elseif matches[2] == 'photo' then
mute_photo_group(msg, msg.chat_id)
elseif matches[2] == 'document' then
mute_document_group(msg, msg.chat_id)
elseif matches[2] == 'gif' then
mute_gif_group(msg, msg.chat_id)
elseif matches[2] == 'audio' then
mute_audio_group(msg, msg.chat_id)
elseif matches[2] == 'voice' then
mute_voice_group(msg, msg.chat_id)
elseif matches[2] == 'video' then
mute_video_group(msg, msg.chat_id)
end
elseif matches[1] == 'unmute' or matches[1] == 'unlock' then
if matches[2] == 'all' then
unmute_all_group(msg, msg.chat_id,group )
elseif matches[2] == 'text' then
unmute_text_group(msg, msg.chat_id)
elseif matches[2] == 'photo' then
unmute_photo_group(msg, msg.chat_id)
elseif matches[2] == 'document' then
unmute_document_group(msg, msg.chat_id)
elseif matches[2] == 'gif' then
unmute_gif_group(msg, msg.chat_id)
elseif matches[2] == 'audio' then
unmute_audio_group(msg, msg.chat_id)
elseif matches[2] == 'voice' then
unmute_voice_group(msg, msg.chat_id)
elseif matches[2] == 'video' then
unmute_video_group(msg, msg.chat_id)
end
end
end
end
---------------

return {
  patterns = {
    "^[/#!](lock) (.*)$",
    "^[/#!](unlock) (.*)$",
    "^[/#!](mute) (.*)$",
    "^[/#!](unmute) (.*)$",
    "^[/#!](settings)$",
"^!!!edit:[/#!](lock) (.*)$",
"^!!!edit:[/#!](unlock) (.*)$",
"^!!!edit:[/#!](mute) (.*)$",
"^!!!edit:[/#!](unmute) (.*)$",
"^!!!edit:[/#!](settings)$"
  },
  run = run
}
--@mafia_cli
--https://github.com/mafia-007





