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
    'gimg':             'https://google.com/search?q={}&tbm=isch',
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
    'dicc':             'https://www.diccionarios.com/diccionario/espanol/{}',
    'oxf':              'https://www.oxfordlearnersdictionaries.com/us/definition/english/{}',
    'hoogle':           'https://hoogle.haskell.org/?hoogle={}',
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
    'reddit':           'https://reddit.com/search?q={}',
    'r':                'https://reddit.com/search?q={}',
    'curse':            'https://curseforge.com/minecraft/mc-mods/search?search={}',
    'shop':             'https://google.com/search?q={}&tbm=shop',
    'steam':            'https://store.steampowered.com/search/?term={}',
    'steamdb':          'https://steamdb.info/search/?a=all&q={}',
    'dailymotion':      'https://www.dailymotion.com/search/{}/videos',

    # TRANSLATORS
    'en':               'https://translate.google.com/?hl=es&sl=en&tl=es&text={}&op=translate',
    'Gen':              'https://translate.google.com/?hl=es&sl=en&tl=es&text={}&op=translate',
    '.en':              'https://www.deepl.com/en/translator#en/es-419/{}',

    'es':               'https://translate.google.com/?hl=es&sl=es&tl=en&text={}&op=translate',
    'Ges':              'https://translate.google.com/?hl=es&sl=es&tl=en&text={}&op=translate',
    '.es':              'https://www.deepl.com/en/translator#es/en-us/{}',

    'fr':               'https://translate.google.com/?sl=fr&tl=es&text={}&op=translate',
    'Gfr':              'https://translate.google.com/?sl=fr&tl=es&text={}&op=translate',
    '.fr':              'https://www.deepl.com/en/translator#fr/es-419/{}',
    'fr!':              'https://translate.google.com/?sl=es&tl=fr&text={}&op=translate',
    'Gfr!':             'https://translate.google.com/?sl=es&tl=fr&text={}&op=translate',
    '.fr!':             'https://www.deepl.com/en/translator#es/fr/{}',

    'it':               'https://translate.google.com/?sl=it&tl=es&text={}&op=translate',
    'Git':              'https://translate.google.com/?sl=it&tl=es&text={}&op=translate',
    '.it':              'https://www.deepl.com/en/translator#it/es-419/{}',
    'it!':              'https://translate.google.com/?sl=es&tl=it&text={}&op=translate',
    'Git!':             'https://translate.google.com/?sl=es&tl=it&text={}&op=translate',
    '.it!':             'https://www.deepl.com/en/translator#es/it/{}',

    'pt':               'https://translate.google.com/?hl=es&sl=pt&tl=es&text={}',
    'Gpt':              'https://translate.google.com/?hl=es&sl=pt&tl=es&text={}',
    '.pt':              'https://www.deepl.com/en/translator#pt/es-419/{}',
    'pt!':              'https://translate.google.com/?hl=es&sl=es&tl=pt&text={}',
    'Gpt!':             'https://translate.google.com/?hl=es&sl=es&tl=pt&text={}',
    '.pt!':             'https://www.deepl.com/en/translator#es/pt/{}',

    'de':               'https://translate.google.com/?sl=de&tl=es&text={}&op=translate',
    'Gde':              'https://translate.google.com/?sl=de&tl=es&text={}&op=translate',
    '.de':              'https://www.deepl.com/en/translator#de/es-419/{}',
    'de!':              'https://translate.google.com/?sl=es&tl=de&text={}&op=translate',
    'Gde!':             'https://translate.google.com/?sl=es&tl=de&text={}&op=translate',
    '.de!':             'https://www.deepl.com/en/translator#es/de/{}',

    'eo':               'https://translate.google.com/?hl=es&sl=eo&tl=es&text={}&op=translate',
    'eo!':              'https://translate.google.com/?hl=es&sl=es&tl=eo&text={}&op=translate',

    'la':               'https://translate.google.com/?hl=es&sl=la&tl=es&text={}&op=translate',
    'la!':              'https://translate.google.com/?hl=es&sl=es&tl=la&text={}&op=translate',
    'latin':            'https://translate.google.com/?sl=la&tl=es&text={}&op=translate',
    'latin!':           'https://translate.google.com/?sl=es&tl=la&text={}&op=translate',

    'dtc':              'https://translate.google.com/?sl=auto&tl=es&text={}&op=translate',
    'dtcen':            'https://translate.google.com/?sl=auto&tl=en&text={}&op=translate',

    # Bibliotecas
    'books':            'https://ravebooksearch.com/#gsc.tab=0&gsc.q={}&gsc.sort=',
    'anna':             'https://annas-archive.li/search?index=&page=1&q={}&display=&ext=pdf&ext=mobi&ext=fb2&ext=cbr&sort=',
    'annas':            'https://annas-archive.li/search?q={}',
    'libgen':           'https://libgen.is/search.php?req={}'
}
