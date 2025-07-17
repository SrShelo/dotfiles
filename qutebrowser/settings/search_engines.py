# ~# Search engines #~
c.url.searchengines = {
    # 'DEFAULT':          'https://google.com/search?q={}',
    'DEFAULT':                'https://duckduckgo.com/?t=h_&q={}&ia=web',
    # '.':                'https://google.com/search?q={}',
    '.':                'https://duckduckgo.com/?t=h_&q={}&ia=web',
    'd':                'https://duckduckgo.com/?t=h_&q={}&ia=web',
    'ddg':              'https://duckduckgo.com/?t=h_&q={}&ia=web',
    'g':                'https://google.com/search?q={}',
    'google':           'https://google.com/search?q={}',
    # ^
    # | Second default. This is necessary when you search
    # something which casually begins whit a reserved word.
    'img':              'https://duckduckgo.com/?t=h_&q={}&iax=images&ia=images',
    'gimg':              'https://google.com/search?q={}&tbm=isch',
    'gif':              'https://google.com/search?q={}&tbm=isch&tbs=itp:animated',
    'rimg':             'https://google.com/search?q={}+site:reddit.com&tbm=isch',
    'rgif':             'https://google.com/search?q={}+site:reddit.com&tbm=isch&tbs=itp:animated',
    'gl':               'https://google.com/search?q={}&btnI',
    'gs':               'https://scholar.google.com/scholar?q={}',
    'd':                'https://duckduckgo.com/?ia=web&q={}',
    'bing':             'https://bing.com/search?q={}',
    'bingimg':          'https://bing.com/images/search?q={}',
    'yt':               'https://youtube.com/results?search_query={}',
    # Info
    'wiki':             'https://en.wikipedia.org/wiki/{}',
    'rae':              'https://dle.rae.es/{}',
    #AI
    'paper':            'https://semanticscholar.org/search?q={}&sort=relevance',
    'semanticscholar'  :'https://semanticscholar.org/search?q={}&sort=relevance',
    # Tools
    'maps':             'https://google.com/maps/search/{}',
    'wolfram':          'https://wolframalpha.com/input?i={}',
    'trends':           'https://trends.google.es/trends/explore?date=now%201-d&geo=CL&q={}&hl=es',
    # Shop
    'amazon':           'https://www.amazon.com/s?k={}',
    # Misc
    'pocket':           'https://getpocket.com/saves/tags/{}',
    'r':                'https://reddit.com/search?q={}',
    'curse':            'https://curseforge.com/minecraft/mc-mods/search?search={}',
    'shop':             'https://google.com/search?q={}&tbm=shop',
    'steam':            'https://store.steampowered.com/search/?term={}',
    'dailymotion':      'https://www.dailymotion.com/search/{}/videos',
    # TRADUCTOR
    'en':               'https://translate.google.com/?hl=es&sl=en&tl=es&text={}&op=translate',
    'es':               'https://translate.google.com/?hl=es&sl=es&tl=en&text={}&op=translate',
    'eo':               'https://translate.google.cl/?hl=es&sl=eo&tl=es&text={}&op=translate',
    'eo!':              'https://translate.google.cl/?hl=es&sl=es&tl=eo&text={}&op=translate',
    'la':               'https://translate.google.cl/?hl=es&sl=la&tl=es&text={}&op=translate',
    'la!':              'https://translate.google.cl/?hl=es&sl=es&tl=la&text={}&op=translate',
    'fr':               'https://translate.google.com/?sl=fr&tl=es&text={}&op=translate',
    'fr!':              'https://translate.google.com/?sl=es&tl=fr&text={}&op=translate',
    'it':               'https://translate.google.com/?sl=it&tl=es&text={}&op=translate',
    'it!':              'https://translate.google.com/?sl=es&tl=it&text={}&op=translate',
    'pt':               'https://translate.google.com/?hl=es&sl=pt&tl=es&text={}',
    'pt!':              'https://translate.google.com/?hl=es&sl=es&tl=pt&text={}',
    'latin':            'https://translate.google.com/?sl=la&tl=es&text={}&op=translate',
    'latin!':           'https://translate.google.com/?sl=es&tl=la&text={}&op=translate',
    'dct':              'https://translate.google.com/?sl=auto&tl=es&text={}&op=translate',
    'dcten':            'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate',
    # Biblioteca
    'anna':             'https://annas-archive.org/search?index=&page=1&q={}&display=&ext=pdf&ext=mobi&ext=fb2&ext=cbr&sort=',
    'annas':            'https://annas-archive.org/search?q={}',
    'libgen':           'https://libgen.is/search.php?req={}',
    'zlib':             'https://singlelogin.re/s/{}'
}
