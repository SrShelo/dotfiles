# ~# Set theme #~
config.source('themes/nord.py')

# ~# Imports #~
config.source('settings/bindings.py')
config.source('settings/search_engines.py')

# ~# MISC #~
# config.set('fileselect.handler', 'external')
# config.set('fileselect.single_file.command', ['kitty', '--class', 'ranger,ranger', '-e', 'yazi', '--chooser-file', '{}'])
# config.set('fileselect.multiple_files.command', ['kitty', '--class', 'ranger,ranger', '-e', 'yazi', '--chooser-file', '{}'])

# Default selectors:
# SELECTORS = {
#     Group.all: ('a, area, textarea, select, input:not([type=hidden]), button, '
#                 'frame, iframe, link, [onclick], [onmousedown], [role=link], '
#                 '[role=option], [role=button], img'),
#     Group.links: 'a[href], area[href], link[href], [role=link][href]',
#     Group.images: 'img',
#     Group.url: '[src], [href]',
#     Group.inputs: ('input[type=text], input[type=email], input[type=url], '
#                    'input[type=tel], input[type=number], '
#                    'input[type=password], input[type=search], '
#                    'input:not([type]), textarea'),
# }

# mine selectors:
config.set('hints.selectors', {
    **c.hints.selectors,
    'test':         ['[onclick], [onmousedown]'],
    'buttons':      ['button, [role=button]'],
    'media':        ['img, animation, gif, .html5-video-player'],
    'yt':           ['ytd-rich-item-renderer'], # ...'ytd-rich-grid-media', 'ytd-rich-grid-slim-media'],
#                   #  All video imgs             # Just (normal) video imgs   # Just yt shorts imgs
    'yt-titles':    ['#video-title'],
    'html-video':   ['.html5-video-player'],
    'icons':        ['html[system-icons]'],
})

# ~# Aliases #~
c.aliases = {
    'w':                    'session-save',
    'load':                 'session-load',
    'info':                 'message-info {url}',
    'wq':                   'quit --save',
    'x':                    'quit --save',
    '\'':                   'set-mark',
    'savetopocket':         'open -t https://getpocket.com/edit?url={url}',
    'open-hintmedia':       'hint media run open {hint-url}',
    'open-hintmedia-t':     'hint media run open -t {hint-url}',
    'mpv-open':             'spawn --detach umpv {url}', # Open YT video in mpv player
    'mpv-hint':             'hint links run spawn --detach umpv {hint-url}',
    'download-video':       'spawn yt-dlp {url} -P "~/Videos/Downloads/" ;; message-warning "El video se está descargando"', # Download yt video
    'download-music':       'cmd-set-text :yt-dlp -x --audio-format mp3 -f bestaudio -P "~/Music/Downloads/" --embed-thumbnail "{url}" -o "',
    'hint-download-video':  'hint images run spawn yt-dlp {hint-url} -P "~/Videos/Downloads"', # Hint video and download it then
    'editurl':              'cmd-set-text :open {url:pretty}',
    'editurl-t':            'cmd-set-text :open -t -r {url:pretty}',
    # Video
    'play-pause-video':     'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, ytd-rich-item-renderer"); videoPlayer.click()',
    'mute-video-key': 'fake-key m',
    'mute-video': 'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer"); if(videoPlayer.muted == false) { videoPlayer.muted = true } else { videoPlayer.muted = false }',
    'back-5s':       'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer"); videoPlayer.currentTime -= 5; ;; clear-messages',
    'back-1s':       'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer"); videoPlayer.currentTime -= 1; ;; clear-messages',
    'forward-5s':       'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer"); videoPlayer.currentTime += 5; ;; clear-messages',
    'forward-1s':       'clear-messages ;; jseval\
            videoPlayer = document.querySelector("video, player, ytd-rich-item-renderer") ; videoPlayer.currentTime += 1; ;; clear-messages',
    'increase-ff-by-5':     'clear-messages ;; jseval \
        if (typeof(myvel) == "undefined") { myvel = 2 }; videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer") ; myvel = videoPlayer.playbackRate + 0.5 ; (videoPlayer.playbackRate = myvel).toFixed(1);',
    'increase-ff-by-1':     'clear-messages ;; jseval \
        if (typeof(myvel) == "undefined") { myvel = 2 }; videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer") ; myvel = videoPlayer.playbackRate + 0.1 ; (videoPlayer.playbackRate = myvel).toFixed(1);',
    'decree-ff-by-5':       'clear-messages ;; jseval \
        if (typeof(myvel) == "undefined") { myvel = 2 }; videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer") ; myvel = videoPlayer.playbackRate - 0.5 ; (videoPlayer.playbackRate = myvel).toFixed(1);',
    'decree-ff-by-1':       'clear-messages ;; jseval \
        if (typeof(myvel) == "undefined") { myvel = 2 }; videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer") ; myvel = videoPlayer.playbackRate - 0.1 ; (videoPlayer.playbackRate = myvel).toFixed(1);',
    'last-playback-rate':   'clear-messages ;; jseval\
            if (typeof(myvel) == "undefined") { myvel = 2}\
            videoPlayer = document.querySelector("video, player, mp4, ytd-rich-item-renderer");\
            (videoPlayer.playbackRate == 1) ?\
            videoPlayer.playbackRate = (myvel).toFixed(1) :\
            videoPlayer.playbackRate = (1).toFixed(1)',
    'reset-fast-forward':   'clear-messages ;; jseval myvel = 2.0 ; videoPlayer = document.querySelector("video, ytd-rich-item-renderer") ; videoPlayer.playbackRate = (myvel).toFixed(1)',
    'alternate-captions':             'fake-key c',
}
