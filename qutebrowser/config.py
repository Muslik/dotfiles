import subprocess
config.load_autoconfig()

c.tabs.position = "top"

config.bind('b', 'set-cmd-text -s :bookmark-load')
config.bind('B', 'set-cmd-text -s :bookmark-load -t')
c.content.autoplay = False
c.tabs.width = 20
c.auto_save.session = True
c.url.start_pages = "https://www.google.com/"
c.url.searchengines = {
    "DEFAULT" : "https://google.com/search?q={}",
    "yt": "https://www.youtube.com/results?search_query={}",
    "aw": "https://wiki.archlinux.org/index.php?title=Special%3ASearch&search={}"
}
