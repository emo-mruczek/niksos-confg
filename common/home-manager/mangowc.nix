# https://github.com/jawor182/dotfiles/blob/147d707c410a6d1819038ff5cdd385d695b6e65f/.config/mango/config.conf -> THANKS!

{pkgs, ...}: {
  wayland.windowManager.mango = {
    enable = true;
    extraConfig = ''

env = XCURSOR_SIZE,24
env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
env = WLR_NO_HARDWARE_CURSORS,1
#env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
#env = GBM_BACKEND,nvidia-drm
#env = __GLX_VENDOR_LIBRARY_NAME, nvidia

# not working
exec-once = awww-daemon
exec-once = awww img ~/niksos-confg/rose-pine-wallpapers/wallpapers/pixelart/leaves-hard-pixelated.png

# not working
exec-once = waybar

exec-once = nm-applet --indicator & disown
exec-once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
#exec-once = systemctl --user start batsignal
#exec-once = systemctl --user start swayidle
#exec-once = sway-audio-idle-inhibit & disown

# tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
tagrule=id:1,layout_name:dwindle
tagrule=id:2,layout_name:dwindle
tagrule=id:3,layout_name:dwindle
tagrule=id:4,layout_name:dwindle
tagrule=id:5,layout_name:dwindle
tagrule=id:6,layout_name:dwindle
tagrule=id:7,layout_name:dwindle
tagrule=id:8,layout_name:dwindle
tagrule=id:9,layout_name:dwindle

bind=SUPER,n,switch_layout
circle_layout=dwindle

# DEFAULT
bind=SUPER,Left,viewtoleft,0
bind=CTRL,Left,viewtoleft_have_client,0
bind=SUPER,Right,viewtoright,0
bind=CTRL,Right,viewtoright_have_client,0
bind=CTRL+SUPER,Left,tagtoleft,0
bind=CTRL+SUPER,Right,tagtoright,0

bind=SUPER,1,view,1,0
bind=SUPER,2,view,2,0
bind=SUPER,3,view,3,0
bind=SUPER,4,view,4,0
bind=SUPER,5,view,5,0
bind=SUPER,6,view,6,0
bind=SUPER,7,view,7,0
bind=SUPER,8,view,8,0
bind=SUPER,9,view,9,0

bind = SUPER, F, togglefullscreen
bind = SUPER, V, togglefloating

bind = SUPER,Q,spawn,kitty
bind = SUPER,R,spawn,wofi --show drun
bind = SUPER,E,spawn,dolphin
bind = SUPER,L,spawn,librewolf
bind = SUPER,C,killclient,
bind = SUPER+SHIFT, R, reload_config
# blokowanie

# tag: move client to the tag and focus it
# tagsilent: move client to the tag and not focus it
# bind=Alt,1,tagsilent,1
bind=SUPER+SHIFT,1,tag,1,0
bind=SUPER+SHIFT,2,tag,2,0
bind=SUPER+SHIFT,3,tag,3,0
bind=SUPER+SHIFT,4,tag,4,0
bind=SUPER+SHIFT,5,tag,5,0
bind=SUPER+SHIFT,6,tag,6,0
bind=SUPER+SHIFT,7,tag,7,0
bind=SUPER+SHIFT,8,tag,8,0
bind=SUPER+SHIFT,9,tag,9,0

bind=NONE,Print,spawn,$HOME/niksos-confg/common/home-manager/assets/screenshot.sh annotate

#bind = NONE, Print, spawn_shell, grimblast save area - | satty --early-exit --initial-tool brush -f - --output-filename \"~/screenshots/$(date +'screenshot-%Y%m%d%H%M%S.png')\" --copy-command \"wl-copy\"


# BROKEN
windowrule = isnamedscratchpad:1,appid:^(Spotify|signal), isfakefullscreen:1, isfloating:1
bind = SUPER, T, toggle_named_scratchpad, Spotify, none, spotify
bind = SUPER, S, toggle_named_scratchpad, signal, none, signal-desktop

scratchpad_width_ratio=1.0
scratchpad_height_ratio=1.0

#windowrule = isnamedscratchpad:1,appid:signal, isfakefullscreen:1

# Binds for laptop
bindl = NONE, XF86MonBrightnessUp,   spawn, brightnessctl set +5%
bindl = NONE, XF86MonBrightnessDown, spawn, brightnessctl set 5%-
bindl = NONE, XF86AudioRaiseVolume,  spawn, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+
bindl = NONE, XF86AudioLowerVolume,  spawn, wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
bindl = NONE, XF86AudioMute, spawn, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
bind=NONE,XF86AudioNext,spawn,playerctl next
bind=NONE,XF86AudioPrev,spawn,playerctl previous
bind=NONE,XF86AudioPlay,spawn,playerctl play-pause

bind=SUPER+SHIFT,Up,exchange_client,up
bind=SUPER+SHIFT,Down,exchange_client,down
bind=SUPER+SHIFT,Left,exchange_client,left
bind=SUPER+SHIFT,Right,exchange_client,right



# DEFAULTS

# Window effect
blur=0
blur_layer=0
blur_optimized=1
blur_params_num_passes = 2
blur_params_radius = 5
blur_params_noise = 0.02
blur_params_brightness = 0.9
blur_params_contrast = 0.9
blur_params_saturation = 1.2

shadows = 0
layer_shadows = 0
shadow_only_floating = 1
shadows_size = 10
shadows_blur = 15
shadows_position_x = 0
shadows_position_y = 0
shadowscolor= 0x000000ff

border_radius=6
no_radius_when_single=0
focused_opacity=1.0
unfocused_opacity=1.0

# Animation Configuration(support type:zoom,slide)
# tag_animation_direction: 1-horizontal,0-vertical
animations=1
layer_animations=1
animation_type_open=slide
animation_type_close=slide
animation_fade_in=1
animation_fade_out=1
tag_animation_direction=1
zoom_initial_ratio=0.3
zoom_end_ratio=0.8
fadein_begin_opacity=0.5
fadeout_begin_opacity=0.8
animation_duration_move=500
animation_duration_open=400
animation_duration_tag=350
animation_duration_close=800
animation_duration_focus=0
animation_curve_open=0.46,1.0,0.29,1
animation_curve_move=0.46,1.0,0.29,1
animation_curve_tag=0.46,1.0,0.29,1
animation_curve_close=0.08,0.92,0,1
animation_curve_focus=0.46,1.0,0.29,1
animation_curve_opafadeout=0.5,0.5,0.5,0.5
animation_curve_opafadein=0.46,1.0,0.29,1

# Overview Setting
hotarea_size=10
enable_hotarea=1
ov_tab_mode=0
overviewgappi=5
overviewgappo=30

# Misc
no_border_when_single=0
axis_bind_apply_timeout=100
focus_on_activate=1
idleinhibit_ignore_visible=0
sloppyfocus=1
warpcursor=1
focus_cross_monitor=0
focus_cross_tag=0
enable_floating_snap=0
snap_distance=30
cursor_size=24
drag_tile_to_tile=1

# keyboard
repeat_rate=25
repeat_delay=600
numlockon=0
xkb_rules_layout = pl

# Trackpad
# need relogin to make it apply
disable_trackpad=0
tap_to_click=1
tap_and_drag=1
drag_lock=0
trackpad_natural_scrolling=1
disable_while_typing=0
left_handed=0
middle_button_emulation=0
swipe_min_threshold=1

# mouse
# need relogin to make it apply
mouse_natural_scrolling=0

# Appearance
gappih=5
gappiv=5
gappoh=10
gappov=10
scratchpad_width_ratio=0.8
scratchpad_height_ratio=0.9
borderpx=4
rootcolor=0x201b14ff
bordercolor=0x444444ff
focuscolor=0xc9b890ff
maximizescreencolor=0x89aa61ff
urgentcolor=0xad401fff
scratchpadcolor=0x516c93ff
globalcolor=0xb153a7ff
overlaycolor=0x14a57cff

# switch window focus
bind=SUPER,Tab,focusstack,next
bind=ALT,Left,focusdir,left
bind=ALT,Right,focusdir,right
bind=ALT,Up,focusdir,up
bind=ALT,Down,focusdir,down

# switch window status
bind=SUPER,g,toggleglobal,
bind=ALT,Tab,toggleoverview,
bind=ALT,backslash,togglefloating,
bind=ALT,a,togglemaximizescreen,
bind=ALT,f,togglefullscreen,
bind=ALT+SHIFT,f,togglefakefullscreen,
bind=SUPER,i,minimized,
bind=SUPER,o,toggleoverlay,
bind=SUPER+SHIFT,I,restore_minimized
bind=ALT,z,toggle_scratchpad

# monitor switch
bind=alt+shift,Left,focusmon,left
bind=alt+shift,Right,focusmon,right
bind=SUPER+Alt,Left,tagmon,left
bind=SUPER+Alt,Right,tagmon,right

# gaps
bind=ALT+SHIFT,X,incgaps,1
bind=ALT+SHIFT,Z,incgaps,-1
bind=ALT+SHIFT,R,togglegaps

# movewin
bind=CTRL+SHIFT,Up,movewin,+0,-50
bind=CTRL+SHIFT,Down,movewin,+0,+50
bind=CTRL+SHIFT,Left,movewin,-50,+0
bind=CTRL+SHIFT,Right,movewin,+50,+0

# resizewin
bind=CTRL+ALT,Up,resizewin,+0,-50
bind=CTRL+ALT,Down,resizewin,+0,+50
bind=CTRL+ALT,Left,resizewin,-50,+0
bind=CTRL+ALT,Right,resizewin,+50,+0

# Mouse Button Bindings
# btn_left and btn_right can't bind none mod key
mousebind=SUPER,btn_left,moveresize,curmove
mousebind=NONE,btn_middle,togglemaximizescreen,0
mousebind=SUPER,btn_right,moveresize,curresize


# Axis Bindings
axisbind=SUPER,UP,viewtoleft_have_client
axisbind=SUPER,DOWN,viewtoright_have_client


# layer rule
layerrule=animation_type_open:zoom,layer_name:rofi
layerrule=animation_type_close:zoom,layer_name:rofi
    '';
    autostart_sh = ''

    '';
  };
}
