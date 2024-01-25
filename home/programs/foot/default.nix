{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.hyprhome;
in
{
  options.hyprhome.foot = {
    enable = mkOption {
      default = true;
      description = "Whether to enable foot terminal";
      type = types.bool;
    };
  };

  config = mkIf (cfg.gui.enable && cfg.foot.enable) {
    programs.foot.enable = true;

    xdg.configFile."foot/foot.ini".text = ''
      # shell=$SHELL (if set, otherwise user's default shell from /etc/passwd)
      # term=foot (or xterm-256color if built with -Dterminfo=disabled)
      # login-shell=no

      # app-id=foot
      # title=foot
      # locked-title=no

      font=Hack Nerd Font Mono:size=8
      # line-height=<font metrics>
      #letter-spacing=1
      # horizontal-letter-offset=0
      # vertical-letter-offset=0
      # underline-offset=<font metrics>
      # box-drawings-uses-font-glyphs=no
      dpi-aware=True

      # initial-window-size-pixels=700x500  # Or,
      # initial-window-size-chars=<COLSxROWS>
      # initial-window-mode=windowed
      pad=5x5                             # optionally append 'center'
      # resize-delay-ms=100

      # notify=notify-send -a ''${app-id} -i ''${app-id} ''${title} ''${body}

      # bold-text-in-bright=no
      # word-delimiters=,│`|:"'()[]{}<>
      # selection-target=primary
      # workers=<number of logical CPUs>

      [bell]
      urgent=yes
      notify=yes
      # command=
      # command-focused=no

      [scrollback]
      lines=5000
      multiplier=5.0
      # indicator-position=relative
      # indicator-format=

      [url]
      #launch=xdg-open ''${url}
      # label-letters=sadfjklewcmpgh
      # osc8-underline=url-mode
      # protocols=http, https, ftp, ftps, file, gemini, gopher
      # uri-characters=abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_.,~:;/?#@!$&%*+="'()[]

      [cursor]
      # style=block
      # color=<inverse foreground/background>
      # blink=no
      # beam-thickness=1.5
      # underline-thickness=<font underline thickness>

      [mouse]
      hide-when-typing=yes
      # alternate-scroll-mode=yes

      [colors]
      # alpha=1.0
      foreground=FFF7ED
      background=303338

      ## Normal/regular colors (color palette 0-7)
      regular0=303338
      regular1=DF7C8E
      regular2=44B689
      regular3=A1A641
      regular4=7A9BEC
      regular5=BE85D1
      regular6=00B1CE
      regular7=F2E6D4
      # regular0=222222  # black
      # regular1=cc9393  # red
      # regular2=7f9f7f  # green
      # regular3=d0bf8f  # yellow
      # regular4=6ca0a3  # blue
      # regular5=dc8cc3  # magenta
      # regular6=93e0e3  # cyan
      # regular7=dcdccc  # white

      ## Bright colors (color palette 8-15)
      bright0=636363
      bright1=F18AA1
      bright2=58C792
      bright3=B4B44A
      bright4=83ADFF
      bright5=CC94E6
      bright6=16C3DD
      bright7=FFFDFB
      # bright0=666666   # bright black
      # bright1=dca3a3   # bright red
      # bright2=bfebbf   # bright green
      # bright3=f0dfaf   # bright yellow
      # bright4=8cd0d3   # bright blue
      # bright5=fcace3   # bright magenta
      # bright6=b3ffff   # bright cyan
      # bright7=ffffff   # bright white

      ## dimmed colors (see foot.ini(5) man page)
      #dim0=181a1d
      #dim1=b75739
      #dim2=37805a
      #dim3=7b6c22
      #dim4=00737c
      #dim5=357bbf
      #dim6=ac5092
      #dim7=e6cfad

      ## The remaining 256-color palette
      # 16 = <256-color palette #16>
      # ...
      # 255 = <256-color palette #255>

      ## Misc colors
      # selection-foreground=<inverse foreground/background>
      # selection-background=<inverse foreground/background>
      # jump-labels=<regular0> <regular3>
      # urls=<regular3>
      # scrollback-indicator=<regular0> <bright4>

      [csd]
      # preferred=server
      # size=26
      # font=<primary font>
      # color=<foreground color>
      # hide-when-typing=no
      # border-width=0
      # border-color=<csd.color>
      # button-width=26
      # button-color=<background color>
      # button-minimize-color=<regular4>
      # button-maximize-color=<regular2>
      # button-close-color=<regular1>

      [key-bindings]
      # scrollback-up-page=Shift+Page_Up
      # scrollback-up-half-page=none
      # scrollback-up-line=none
      # scrollback-down-page=Shift+Page_Down
      # scrollback-down-half-page=none
      # scrollback-down-line=none
      # clipboard-copy=Control+Shift+c XF86Copy
      # clipboard-paste=Control+Shift+v XF86Paste
      # primary-paste=Shift+Insert
      search-start=Control+Shift+s
      # font-increase=Control+plus Control+equal Control+KP_Add
      # font-decrease=Control+minus Control+KP_Subtract
      # font-reset=Control+0 Control+KP_0
      # spawn-terminal=Control+Shift+n
      # minimize=none
      # maximize=none
      # fullscreen=none
      # pipe-visible=[sh -c "xurls | fuzzel | xargs -r firefox"] none
      # pipe-scrollback=[sh -c "xurls | fuzzel | xargs -r firefox"] none
      # pipe-selected=[xargs -r firefox] none
      # show-urls-launch=Control+Shift+u
      # show-urls-copy=none
      # show-urls-persistent=none
      # noop=none

      [search-bindings]
      # cancel=Control+g Control+c Escape
      # commit=Return
      find-prev=Control+p
      find-next=Control+n
      # cursor-left=Left Control+b
      # cursor-left-word=Control+Left Mod1+b
      # cursor-right=Right Control+f
      # cursor-right-word=Control+Right Mod1+f
      # cursor-home=Home Control+a
      # cursor-end=End Control+e
      # delete-prev=BackSpace
      # delete-prev-word=Mod1+BackSpace Control+BackSpace
      # delete-next=Delete
      # delete-next-word=Mod1+d Control+Delete
      # extend-to-word-boundary=Control+w
      # extend-to-next-whitespace=Control+Shift+w
      # clipboard-paste=Control+v Control+Shift+v Control+y XF86Paste
      # primary-paste=Shift+Insert

      [url-bindings]
      # cancel=Control+g Control+c Control+d Escape
      # toggle-url-visible=t

      [text-bindings]
      # \x03=Mod4+c  # Map Super+c -> Ctrl+c

      [mouse-bindings]
      # selection-override-modifiers=Shift
      # primary-paste=BTN_MIDDLE
      # select-begin=BTN_LEFT
      # select-begin-block=Control+BTN_LEFT
      # select-extend=BTN_RIGHT
      # select-extend-character-wise=Control+BTN_RIGHT
      # select-word=BTN_LEFT-2
      # select-word-whitespace=Control+BTN_LEFT-2
      # select-row=BTN_LEFT-3

      # vim: ft=dosini
    '';
  };
}
