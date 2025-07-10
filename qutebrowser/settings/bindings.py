# ~# Key Bindings #~

# * Unbind
config.unbind('d')
config.unbind('u')
config.unbind('f')
config.unbind('F')
config.unbind('J')
config.unbind('K')
config.unbind('gg')
config.unbind('G')
config.unbind('b')
config.unbind('r')
config.unbind('<Ctrl+q>')
config.unbind('go')
config.unbind('gO')
config.unbind('gC')
config.unbind('gJ')
config.unbind('gK')
# config.unbind('gU')
config.unbind('ga')
config.unbind('pp')
config.unbind('pP')
config.unbind('Pp')
config.unbind('PP')
config.unbind('v')
config.unbind('<Alt+9>')

config.unbind('.')

# * Bind
## Navigation
### left-hand controls
### I tried a real smooth scroll with this jseval hack, but the time of the animation and the fast repeated entry of input (holding a key) makes the scroll behave weirdly
# config.bind('s', 'jseval --quiet window.scrollBy({left:   0, top:-100, behavior: "smooth"})')
# config.bind('x', 'jseval --quiet window.scrollBy({left: 100, top:   0, behavior: "smooth"})')
# config.bind('a', 'jseval --quiet window.scrollBy({left:-100, top:   0, behavior: "smooth"})')
# config.bind('z', 'jseval --quiet window.scrollBy({left:   0, top: 100, behavior: "smooth"})')
# config.bind('<Alt+Ctrl+s>', 'jseval --quiet window.scrollBy({left:   0, top: -10, behavior: "smooth"})')
# config.bind('<Alt+Ctrl+x>', 'jseval --quiet window.scrollBy({left:  10, top:   0, behavior: "smooth"})')
# config.bind('<Alt+Ctrl+a>', 'jseval --quiet window.scrollBy({left: -10, top:   0, behavior: "smooth"})')
# config.bind('<Alt+Ctrl+z>', 'jseval --quiet window.scrollBy({left:   0, top:  10, behavior: "smooth"})')
config.bind('a', 'scroll-px -50 0')
config.bind('z', 'scroll-px 0 50')
config.bind('s', 'scroll-px 0 -50')
config.bind('x', 'scroll-px 50 0')
config.bind('<Alt+Ctrl+a>', 'scroll-px -10 0')
config.bind('<Alt+Ctrl+z>', 'scroll-px 0 10')
config.bind('<Alt+Ctrl+s>', 'scroll-px 0 -10')
config.bind('<Alt+Ctrl+x>', 'scroll-px 10 0')
config.bind('S',  'jseval --quiet window.scroll({top:0, behavior: "smooth"})')
config.bind('gg', 'jseval --quiet window.scroll({top:0, behavior: "smooth"})')
config.bind('Z',  'jseval --quiet window.scroll({top:1000000, behavior: "smooth"})')
config.bind('G',  'jseval --quiet window.scroll({top:1000000, behavior: "smooth"})')
# config.bind('S', 'scroll top')
# config.bind('gg', 'scroll top')
# config.bind('Z', 'scroll bottom')
# config.bind('G', 'scroll bottom')
config.bind('<Ctrl+a>', 'scroll left') # Fake arrow keys
config.bind('<Ctrl+s>', 'scroll up')
config.bind('<Ctrl+x>', 'scroll right')
config.bind('<Ctrl+z>', 'scroll down')
### right-hand controls
config.bind('h', 'scroll-px -50 0')
config.bind('j', 'scroll-px 0 50')
config.bind('k', 'scroll-px 0 -50')
config.bind('l', 'scroll-px 50 0')
config.bind('<Alt+k>', 'scroll top')
config.bind('<Alt+j>', 'scroll bottom')

# Tab controls
## Misc
config.bind('<Ctrl+w>', 'tab-close')
config.bind('<Ctrl+w>', 'tab-close', mode = 'insert')
config.bind('<Alt+w>', 'tab-close')
config.bind('<Alt+w>', 'tab-close', mode = 'insert')
config.bind('<Alt+m>', 'tab-mute')
config.bind('<Alt+v>', 'tab-pin')
config.bind('<Alt+Shift+r>', 'undo')
config.bind('<Alt+Shift+t>', 'undo')
config.bind('<Alt+Shift+r>', 'undo', mode = 'insert')
config.bind('<Alt+Shift+t>', 'undo', mode = 'insert')
## Tab history
config.bind('<Alt+Shift+z>', 'back')
config.bind('<Alt+Shift+z>', 'back', mode = 'insert')
config.bind('<Alt+<Left>', 'back')
config.bind('<Alt+<Left>', 'back', mode = 'insert')
config.bind('<Alt+Shift+s>', 'forward')
config.bind('<Alt+Shift+s>', 'forward', mode = 'insert')
config.bind('<Alt+<Right>', 'forward') ## Alt + Right arrow
config.bind('<Alt+<Right>', 'forward', mode = 'insert')
config.bind('<Shift+<Left>', 'back')
config.bind('<Shift+<Right>', 'forward')
## Navigation
config.bind('<Alt+1>', 'tab-focus 1', mode = 'insert')
config.bind('<Alt+2>', 'tab-focus 2', mode = 'insert')
config.bind('<Alt+3>', 'tab-focus 3', mode = 'insert')
config.bind('<Alt+4>', 'tab-focus 4', mode = 'insert')
config.bind('<Alt+5>', 'tab-focus 5', mode = 'insert')
config.bind('<Alt+6>', 'tab-focus 6', mode = 'insert')
config.bind('<Alt+7>', 'tab-focus 7', mode = 'insert')
config.bind('<Alt+8>', 'tab-focus 8', mode = 'insert')
config.bind('<Alt+9>', 'tab-focus 9')
config.bind('<Alt+9>', 'tab-focus 9', mode = 'insert')
config.bind('<Alt+0>', 'tab-focus -1')
config.bind('<Alt+0>', 'tab-focus -1', mode = 'insert')
config.bind('<Alt+a>', 'tab-prev')
config.bind('<Alt+a>', 'tab-prev', mode = 'insert')
config.bind('<Alt+x>', 'tab-next')
config.bind('<Alt+x>', 'tab-next', mode = 'insert')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.bind('<Alt+<Tab>', 'tab-focus last')
config.bind('<Alt+<Tab>', 'tab-focus last', mode = 'insert')
config.bind('<Ctrl+Shift+s>', 'zoom-in')
config.bind('<Ctrl+Shift+z>', 'zoom-out')
## Swap tabs
config.bind('<Alt+Shift+a>', 'tab-move -')
config.bind('<Alt+Shift+a>', 'tab-move -', mode = 'insert')
config.bind('<Alt+Shift+x>', 'tab-move +')
config.bind('<Alt+Shift+x>', 'tab-move +', mode = 'insert')

# Basics
config.bind('d', 'hint buttons')
config.bind('D', 'hint links tab-bg')
config.bind('fp', 'open -- {clipboard}')
config.bind('fP', 'open -t -- {clipboard}')
## Extended Hints
config.bind('<Alt+d>i', 'hint inputs')
config.bind('<Alt+d>a', 'hint all')
config.bind('<Alt+d>d', 'hint buttons')
config.bind('<Alt+d>D', 'hint buttons run open -t {hint-url}')
config.bind('<Alt+d>q', 'hint links')
config.bind('<Alt+d>Q', 'hint links run open -t {hint-url}')
config.bind('<Alt+d>w', 'hint images')
config.bind('<Alt+d>W', 'hint images run open -t {hint-url}')
# config.bind('<Alt+d>a', 'hint yt')
config.bind('<Alt+d>e', 'open-hintmedia')
config.bind('<Alt+d>E', 'open-hintmedia-t')
config.bind('<Alt+d>v', 'mpv-hint')

config.bind('<Alt+Shift+d>a', 'hint all tab')
config.bind('<Alt+Shift+d>q', 'hint yt run open -t {hint-url}')
config.bind('<Alt+Shift+d>e', 'open-hintmedia-t')

# Enter and exit insert mode
config.bind('i', 'mode-enter insert ;; clear-messages ;; message-warning "-- Insert Mode --"', mode='normal')
config.bind('<Esc>', 'mode-enter normal ;; clear-messages ;; message-info "-- Normal Mode --"', mode='insert')

# MISC
## Open devtools
config.bind('<Ctrl+Shift+i>', 'devtools', mode='normal')
config.bind('<Ctrl+Shift+i>', 'devtools', mode='insert')
config.bind('<Esc>', 'fake-key <Esc>', mode='normal')
config.bind('<Ctrl+c>', 'yank selection')
# /match
# from qutebrowser.browser import browsertab

# config.bind('n', 'search-next ;; clear-messages ;; message-info "number n "')
# config.bind('N', 'search-prev ;; clear-messages ;; message-info "number N"')

## F functions
config.bind('fw', 'tab-give')
config.bind('fW', 'undo -w')
config.bind('fr', 'reload')
config.bind('fi', 'info')
config.bind('fz', 'undo')
config.bind('fc', 'tab-clone')
config.bind('fe', 'editurl') # edit URL
config.bind('fE', 'editurl-t') # edit and open URL in new tab
config.bind('fs', 'savetopocket')
### Donwloads
config.bind('fdd', 'download-clear')
config.bind('fdx', 'download-cancel')
## P functions
config.bind('ph', 'config-cycle statusbar.show always never') # Hide/Unhide statusbar
config.bind('p<Alt+h>', 'config-cycle tabs.show always never') # Hide/Unhide tabs
config.bind('pH', 'config-cycle statusbar.show always never ;;\
            config-cycle tabs.show always never') # Hide/Unhide both
## G functions

## B functions
config.bind('bv', 'download-video')
config.bind('bm', 'download-music')
config.bind('bb', 'download')

config.bind('Bv', 'hint-download-video')

# Video basic
config.bind('<Space>', 'fake-key <Space>')
config.bind('v<Space>', 'play-pause-video')
config.bind('<Up>', 'fake-key <Up>')
config.bind('<Left>', 'fake-key <Left>')
config.bind('<Down>', 'fake-key <Down>')
config.bind('<Right>', 'fake-key <Right>')
config.bind('1', 'fake-key 1')
config.bind('2', 'fake-key 2')
config.bind('3', 'fake-key 3')
config.bind('4', 'fake-key 4')
config.bind('5', 'fake-key 5')
config.bind('6', 'fake-key 6')
config.bind('7', 'fake-key 7')
config.bind('8', 'fake-key 8')
config.bind('9', 'fake-key 9')
config.bind('0', 'fake-key 0')
config.bind('c', 'fake-key c')
# Video
config.bind('Q', 'back-5s')
config.bind('<Alt+Shift+q>', 'back-1s')
config.bind('q', 'forward-5s')
config.bind('<Alt+q>', 'forward-1s')
config.bind('r', 'fake-key f')
config.bind('<Alt+r>', 'fake-key i')
config.bind('w', 'last-playback-rate')
config.bind('E', 'increase-ff-by-5')
config.bind('<Alt+Shift+e>', 'increase-ff-by-1')
config.bind('W', 'decree-ff-by-5')
config.bind('<Alt+Shift+w>', 'decree-ff-by-1')
# 'V' bindings
config.bind('vr', 'reset-fast-forward')
config.bind('vq', 'decree-ff-by-5')
config.bind('v<Alt+q>', 'decree-ff-by-1')
config.bind('vc', 'alternate-captions')
config.bind('vM', 'mute-video')
config.bind('vm', 'mute-video-key')
config.bind('vw', 'mpv-open')

# msg = str(c.bindings.commands)
# # config.bind('<Alt+c>', "spawn kitty -e command.sh "+msg)
# f = open('qt.log', 'a')
# f.write(msg)
# f.close()
