# https://github.com/jawor182/dotfiles/blob/147d707c410a6d1819038ff5cdd385d695b6e65f/.config/mango/config.conf -> THANKS!

{osConfig, lib, ...}: let

  inherit (lib) elemAt attrNames attrValues;
  inherit (osConfig) monitors;
  monitor = elemAt (attrValues monitors) 0;

in {
  wayland.windowManager.mango = {
    enable = true;
    extraConfig = ''

      monitor_rule=name:${elemAt( attrNames monitors) 0},width:${toString monitor.resolution.width},height:${toString monitor.resolution.height},refresh:${toString monitor.refreshRate}

env = XCURSOR_SIZE,24
#env = QT_QPA_PLATFORMTHEME,qt5ct # change to qt6ct if you have that
env = WLR_NO_HARDWARE_CURSORS,1
#env = LIBVA_DRIVER_NAME,nvidia
env = XDG_SESSION_TYPE,wayland
#env = GBM_BACKEND,nvidia-drm
#env = __GLX_VENDOR_LIBRARY_NAME, nvidia
env = QT_STYLE_OVERRIDE,kvantum;
env = QT_AUTO_SCREEN_SCALE_FACTOR,1;
env = QT_QPA_PLATFORM,wayland;xcb;
env = QT_WAYLAND_DISABLE_WINDOWDECORATION,1;
env = DISABLE_QT_COMPAT,0;


# not working
exec_once = awww-daemon
exec_once = awww img ~/niksos-confg/rose-pine-wallpapers/wallpapers/pixelart/leaves-hard-pixelated.png


exec_once = waybar

exec_once = nm-applet --indicator & disown
exec_once = dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
#exec-once = systemctl --user start batsignal
#exec-once = systemctl --user start swayidle
#exec-once = sway-audio-idle-inhibit & disown

# tile,scroller,grid,deck,monocle,center_tile,vertical_tile,vertical_scroller
tag_rule=id:1,layout_name:dwindle
tag_rule=id:2,layout_name:dwindle
tag_rule=id:3,layout_name:dwindle
tag_rule=id:4,layout_name:dwindle
tag_rule=id:5,layout_name:dwindle
tag_rule=id:6,layout_name:dwindle
tag_rule=id:7,layout_name:dwindle
tag_rule=id:8,layout_name:dwindle
tag_rule=id:9,layout_name:dwindle

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

#bind=NONE,Print,spawn,$HOME/niksos-confg/common/home-manager/assets/screenshot.sh annotate

bind = NONE, Print, spawn_shell, slurp | grim -g - -  | satty --early-exit --initial-tool brush -f - --output-filename "~/screenshots/$(date +%Y%m%d%H%M%S).png" --copy-command \"wl-copy\"

window_rule = is_named_scratchpad:1,app_id:^(Spotify|signal|keepassxc), is_fake_fullscreen:1, is_floating:1
bind = SUPER, T, toggle_named_scratchpad, Spotify, none, spotify
bind = SUPER, S, toggle_named_scratchpad, signal, none, signal-desktop
bind = SUPER, K, toggle_named_scratchpad, keepassxc, none, org.keepassxc.KeePassXC

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
shadows_color= 0x000000ff

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
fade_in_begin_opacity=0.5
fade_out_begin_opacity=0.8
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
animation_curve_opacity_fade_out=0.5,0.5,0.5,0.5
animation_curve_opacity_fade_in=0.46,1.0,0.29,1

# Overview Setting
hotarea_size=10
enable_hotarea=1
#ov_tab_mode=0
overview_gap_inner=5
overview_gap_outer=30

# Misc
no_border_when_single=0
axis_bind_apply_timeout=100
focus_on_activate=1
idle_inhibit_ignore_visible=0
sloppy_focus=1
warp_cursor=1
focus_cross_monitor=0
focus_cross_tag=0
enable_floating_snap=0
snap_distance=30
cursor_size=24
drag_tile_to_tile=1

# keyboard
repeat_rate=25
repeat_delay=600
numlock_on=0
xkb_rules_layout = pl

# Trackpad
# need relogin to make it apply
disable_trackpad=0
tap_to_click=1
tap_and_drag=1
drag_lock=0
trackpad_natural_scrolling=1
trackpad_disable_while_typing=0
trackpad_left_handed=0
trackpad_middle_button_emulation=0
swipe_min_threshold=1

# mouse
# need relogin to make it apply
mouse_natural_scrolling=0

# Appearance
gap_inner_horizontal=5
gap_inner_vertical=5
gap_outer_horizontal=10
gap_outer_vertical=10
scratchpad_width_ratio=0.8
scratchpad_height_ratio=0.9
border_px=4
root_color=0x201b14ff
border_color=0x444444ff
focus_color=0xc9b890ff
maximized_screen_color=0x89aa61ff
urgent_color=0xad401fff
scratchpad_color=0x516c93ff
global_color=0xb153a7ff
overlay_color=0x14a57cff

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
mousebind=SUPER,btn_middle,togglemaximizescreen,0
mousebind=SUPER,btn_right,moveresize,curresize


# Axis Bindings
axisbind=SUPER,UP,viewtoleft_have_client
axisbind=SUPER,DOWN,viewtoright_have_client


# layer rule
layer_rule=animation_type_open:zoom,layer_name:rofi
layer_rule=animation_type_close:zoom,layer_name:rofi
    '';
  };
}
