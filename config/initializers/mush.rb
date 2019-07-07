require 'mush'

BITLY = Mush::Services::Bitly.new

BITLY.login = ENV['bitly_login']
BITLY.apikey = ENV['bitly_api_key']

# isgd = Mush::Services::IsGd.new
# isgd.shorten "http://foo.raflabs.com"

# custom = Mush::Services::Custom.new
# custom.set_service = "http://chop.ws/index.php?api=1&return_url_text=1&longUrl={{url}}"
# custom.shorten 'foo.raflabs.com'