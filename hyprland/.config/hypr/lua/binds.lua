hl.bind("SUPER + Q", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + C", hl.dsp.window.close())
hl.bind("SUPER + E", hl.dsp.exec_cmd("dolphin"))
hl.bind("SUPER + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + space", hl.dsp.exec_cmd("wofi --show drun"))
hl.bind("SUPER + x", hl.dsp.exec_cmd("hyprlock"))

hl.bind("SUPER + h", hl.dsp.window.move({ direction = "l" }))
hl.bind("SUPER + j", hl.dsp.window.move({ direction = "d" }))
hl.bind("SUPER + k", hl.dsp.window.move({ direction = "u" }))
hl.bind("SUPER + l", hl.dsp.window.move({ direction = "r" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = 3 }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = 4 }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = 5 }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = 6 }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = 7 }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = 8 }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = 9 }))
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind("SUPER + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind("SUPER + left", hl.dsp.workspace.move({ monitor = "l" }))
hl.bind("SUPER + right", hl.dsp.workspace.move({ monitor = "r" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 2, monitor = "l" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 3, monitor = "l" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 4, monitor = "l" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 5, monitor = "l" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 6, monitor = "l" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 7, monitor = "r" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 8, monitor = "r" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 9, monitor = "r" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 10, monitor = "r" }))
hl.bind("SUPER + down", hl.dsp.workspace.move({ workspace = 11, monitor = "r" }))

-- bind = $mainMod, `, togglespecialworkspace, magic
-- bind = $mainMod SHIFT, `, movetoworkspace, special:magic

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- bind = $mainMod SHIFT, S, exec, \
-- area=$(slurp) && \
-- grim -g "$area" - | swappy -f -
--
-- bind = $mainMod SHIFT, P, exec, \
-- magick -size 1440x900 xc:white png:- | swappy -f -
--
-- # wf-recorder -f filename.mp4
-- # wf-recorder -g "$(slurp)" -f filename.mp4
--
-- # Laptop multimedia keys for volume and LCD brightness
-- bindel = ,XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+
-- bindel = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
-- bindel = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
-- bindel = ,XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle
-- bindel = ,XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+
-- bindel = ,XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-

-- # Requires playerctl
-- bindl = , XF86AudioNext, exec, playerctl next
-- bindl = , XF86AudioPause, exec, playerctl play-pause
-- bindl = , XF86AudioPlay, exec, playerctl play-pause
-- bindl = , XF86AudioPrev, exec, playerctl previous
