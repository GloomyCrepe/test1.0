# replace string, use freeze to frozen constants
HTML_FILE = 'docs/index.html'.freeze
SCRIPT = '<script src="main.js"></script>'.freeze
AUDIO = %(<audio loop="loop" autoplay="autoplay" src="bgm.mp3" id="audios"></audio>\n).freeze
PLAY_AUDIO = "
\n<script>
    document.addEventListener('touchstart', function() {
        document.getElementById('audios').play()
    });
    document.addEventListener('WeixinJSBridgeReady', function() {
        document.getElementById('audios').play()
    })
</script>
".freeze
ICON = %(<link rel="icon" href="favicon.ico">\n).freeze
HEAD = '</head>'.freeze

# exec build cmd
system 'mdx-deck build deck.mdx -d docs'

begin
  # File.read will automatically close the file
  html_content = File.read(HTML_FILE)
  html_content.gsub!(SCRIPT, AUDIO + SCRIPT + PLAY_AUDIO)
  html_content.gsub!(HEAD, ICON + HEAD)

  File.open(HTML_FILE, 'w+:UTF-8') do |f|
    f.write html_content
  end
  # file not found exception
rescue SystemCallError => ex
  puts ex.message
end

puts 'replace string done'
