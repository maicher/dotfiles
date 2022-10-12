# DOT SKIP server
local utils = require "mp.utils"

local function get_final_path()
   local work_dir = mp.get_property_native("working-directory")
   local file_path = mp.get_property_native("path")
   local s = file_path:find(work_dir, 0, true)
   local final_path

   if s and s == 0 then
      final_path = file_path
   else
      final_path = utils.join_path(work_dir, file_path)
   end

   return final_path
end

function move_to_trash()
  local final_path = get_final_path()

   mp.osd_message("Moving to trash")
   os.execute("trash -t -f '"..final_path.."'")
end

function delete()
  local final_path = get_final_path()

   mp.osd_message("Deleting")
   os.execute("rm '"..final_path.."'")
end

function set_marker()
  local timestamp = mp.get_property_native("playback-time")
  local final_path = get_final_path()

  os.execute("echo '"..timestamp.."' >> '"..final_path.."_markers.txt'")
  mp.osd_message("Marker set "..timestamp)
end

function set_marker_with_overwrite()
  local timestamp = mp.get_property_native("playback-time")
  local final_path = get_final_path()

  os.execute("echo '"..timestamp.."' > '"..final_path.."_markers.txt'")
  mp.osd_message("Marker set (with overwrite)"..timestamp)
end

function set_marker_with_start_at_zero()
  local final_path = get_final_path()

  os.execute("echo 0.0 > '"..final_path.."_markers.txt'")
  set_marker()
end

mp.add_key_binding("ctrl+d", "move_to_trash", move_to_trash)
mp.add_key_binding("ctrl+D", "delete", delete)
mp.add_key_binding("ctrl+m", "set_marker", set_marker)
mp.add_key_binding("ctrl+M", "set_marker_with_overwrite", set_marker_with_overwrite)
mp.add_key_binding("ctrl+n", "set_marker_with_start_at_zero", set_marker_with_start_at_zero)
