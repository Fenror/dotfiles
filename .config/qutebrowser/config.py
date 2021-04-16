config.load_autoconfig(False)
config.bind('ö', 'set-cmd-text :')
config.bind('-', 'set-cmd-text /')
config.bind('t', 'set-cmd-text -s :open -t')
config.bind('<Ctrl-n>', 'tab-next')
config.bind('<Ctrl-tab>', 'tab-next')
config.bind('<Ctrl-p>', 'tab-prev')
config.bind('<Ctrl-Shift-tab>', 'tab-prev')
config.bind('O', 'set-cmd-text :open {url:pretty}')
config.bind('T', 'set-cmd-text :open -t {url:pretty}')

config.set('qt.highdpi', True)
config.set('qt.environ', {"QT_SCALE_FACTOR": "1.25"})

c.colors.hints.bg = '#FFFFFF'
c.downloads.location.directory = '~/downloads'
c.hints.border = '1px dotted #000000'
c.hints.mode = 'number'
c.url.default_page = 'about:blank'
c.url.start_pages = 'about:blank'
c.url.searchengines = {"DEFAULT": "https://google.com/search?q={}", "yt": "https://youtube.com/results?search_query={}"}
c.completion.web_history.max_items = 0
c.tabs.position = 'top'
c.tabs.width = '4%'
c.tabs.background = True
c.tabs.last_close = 'blank'
c.zoom.default = '100%'
c.qt.args = ["enable-gpu-rasterization", "ignore-gpu-blacklist", "enable-native-gpu-memory-buffers", "num-raster-threads=4"]
