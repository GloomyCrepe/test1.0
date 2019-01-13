import os

# exec build cmd
os.system("mdx-deck build deck.mdx -d docs")

# replace string
HTML_FILE = "docs/index.html"
SCRIPT = '<script src="main.js"></script>'
AUDIO = '<audio loop="loop" autoplay="autoplay" src="bgm.mp3" id="audios"></audio>\n'
PLAY_AUDIO = """
\n<script>
    document.addEventListener('touchstart', function() {
        document.getElementById('audios').play()
    });
    document.addEventListener('WeixinJSBridgeReady', function() {
        document.getElementById('audios').play()
    })
</script>
"""
ICON = '<link rel="icon" href="favicon.ico">\n'
HEAD = "</head>"

try:
    with open(HTML_FILE, "r", encoding="utf8") as fin:
        html_content = fin.read()
        html_content = html_content.replace(
            SCRIPT, AUDIO + SCRIPT + PLAY_AUDIO
        ).replace(HEAD, ICON + HEAD)
        with open(HTML_FILE, "w+", encoding="utf8") as fout:
            fout.write(html_content)
    print("replace string done")
except Exception as e:
    print(e)
