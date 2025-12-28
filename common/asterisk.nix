{pkgs, ...}: {
  environment.etc."asterisk/easy.mp3".source = ./easy.mp3;

  services.asterisk = {
    enable = true;

    package = pkgs.asterisk.overrideAttrs (old: {
      patches = (old.patches or []) ++ [./dupa];
    });

    confFiles = {
      "extensions.conf" = ''
        [asi]
        exten => _X.,1,NoOp(Przychodzące połączenie z Asitelu!)
        same => n,Set(CALLERID(num)=6''${CALLERID(num)})
        same => n,Goto(wew,''${EXTEN},1)

        [wew]


        exten => _.!,1,Answer()
        same => n,Playback(/etc/asterisk/easy)
        same => n,Hangup()

        [default]
        include => wew
      '';
      "extensions.lua.disabled" = ''
        function smutek(zz)
            app.verbose(1, "Smutek telefoniczny!")
            local slist = {"carnival", "japandroids", "julien", "metropolis", "ocean", "dawnofman"}
            math.randomseed(os.time())
            local x = math.random(1, 100)
            x = math.random(1, 10)
            x = math.random(100, 1000)
            for i=1,zz,1 do
                x = math.random(1, #slist)
                app.playback("/home/centrala/smutek-telefoniczny/" .. slist[x])
                table.remove(slist, x)
                if #slist == 1 then
                    break
                end
            end
        end

        function dom()
            bobr = 1
            app.read("pin", nil, 1, "i", nil, 5)
            bobr = channel.pin:get()

            app.saynumber(bobr)
            if bobr == '1' then
                app.playback("/home/centrala/inne/oblivion")
            elseif bobr == '2' then
                app.playback("/home/centrala/inne/punpkinparty")
            elseif bobr == '3' then
                app.playback("/home/centrala/inne/ultimatum")
            else
                app.playback("/home/centrala/inne/punpkinparty")
            end
        end

        extensions = {
            default = {
                ["142"] = function(context, extension)
                    smutek(10)
                    app.hangup()
                end;
                ["109"] = function(context, extension)
                    app.playback("/home/centrala/inne/109tram")
                    app.hangup()
                end;

            },
            wew = {
                ["_6X.!"] = function(con, ext)
                    app.dial("PJSIP/" .. ext:sub(2) .. "@asi")
                    app.hangup()
                end;
                        ["_7X.!"] = function(con, ext)
                                app.dial("IAX2/bar/" .. ext:sub(2) ) --.. "@bar")
                                app.hangup()
                        end;
                        ["_9X.!"] = function(con, ext)
                                app.dial("PJSIP/" .. ext:sub(2) .. "@epvpn-endpoint")
                                app.hangup()
                        end;
            }
        }
      '';
      "modules.conf" = ''
        ;
        ; Asterisk configuration file
        ;
        ; Module Loader configuration file
        ;

        [modules]
        autoload=yes

        ;Wyłączenie tego czego nie trzeba
        noload => chan_mobile.so
        noload => res_prometheus.so
        noload => res_adsi.so
        noload => app_getcpeid.so
        noload => app_adsiprog.so


        ;
        ; Any modules that need to be loaded before the Asterisk core has been
        ; initialized (just after the logger has been initialized) can be loaded
        ; using 'preload'. This will frequently be needed if you wish to map all
        ; module configuration files into Realtime storage, since the Realtime
        ; driver will need to be loaded before the modules using those configuration
        ; files are initialized.
        ;
        ; An example of loading ODBC support would be:
        ;preload => res_odbc.so
        ;preload => res_config_odbc.so
        ;
        ; If you want, load the GTK console right away.
        ; Don't load the KDE console since
        ; it's not as sophisticated right now.
        ;
        noload => pbx_gtkconsole.so
        ;load => pbx_gtkconsole.so
        noload => pbx_kdeconsole.so
        ;
        ; Intercom application is obsoleted by
        ; chan_oss.  Don't load it.
        ;
        noload => app_intercom.so
        ;
        ; The 'modem' channel driver and its subdrivers are
        ; obsolete, don't load them.
        ;
        noload => chan_modem.so
        noload => chan_modem_aopen.so
        noload => chan_modem_bestdata.so
        noload => chan_modem_i4l.so
        ;
        ; Comment this out (after installing CAPI middleware and hardware
        ; drivers) if you have CAPI-able hardware and wish to use it in
        ; Asterisk.
        ;
        noload => chan_capi.so
        ;
        load => res_musiconhold.so
        ;
        ; Do not load load local channel drivers (using the system speaker) by default,
        ; they are not used in most installations and might block the sound hardware
        ;
        noload => chan_alsa.so
        noload => chan_console.so
        noload => chan_oss.so
        ;
        ; Disable CDR logging to SQLite by default since it writes unconditionally to
        ; cdr.db without a way to rotate it.
        ;
        noload => cdr_sqlite.so
        ;
        ; These conflict with app_directory.so and each other.
        noload => app_directory_odbc.so
        ;
        ; Enable these if you want to configure Asterisk in a database
        ;
        noload => res_config_odbc.so
        noload => res_config_pgsql.so
        ;
        ; Module names listed in "global" section will have symbols globally
        ; exported to modules loaded after them.
        ;
        [global]
      '';
      "pjsip.conf" = ''
        [transport-udp]
        type=transport
        protocol=udp
        bind=0.0.0.0

        [asi]
        type = auth
        auth_type = userpass
        username = asi
        password = fk2Amj5REsz4NnxUV>oWcv

        [asi]
        type = aor
        contact = sip:192.168.147.9
        max_contacts=1

        [asi]
        type = endpoint
        context = asi
        allow = !all,g722,ulaw,alaw
        direct_media = no
        auth = asi
        aors = asi

        [asi]
        type = identity
        match = 192.168.147.9
        endpoint = asi

        [asi]
        type = identify
        match = 192.168.147.9
        endpoint = asi

        [typowe](!)
        type=endpoint
        context=wew
        disallow=all
        allow=g722,ulaw,alaw
        ;codec_prefs_incoming_offer = prefer: pending, operation: union, keep: all, transcode: allow
        ;codec_prefs_outgoing_offer = prefer: pending, operation: intersect, keep: all, transcode: allow

        [401](typowe)
        type=endpoint
        ;context=wew
        ;disallow=all
        ;allow=ulaw
        auth=401
        aors=401

        [401]
        type=auth
        auth_type=userpass
        password=gVj6tQssQhHa0TGe6Jrt
        username=401

        [401]
        type=aor
        max_contacts=1

      '';
    };
  };

  networking.firewall = {
    allowedUDPPortRanges = [
      {
        from = 10000;
        to = 20000;
      }
    ];
    allowedUDPPorts = [5060 5061];
    allowedTCPPorts = [5060 5061];
  };
}
