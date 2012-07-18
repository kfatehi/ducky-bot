require "ducky-bot/version"
require "ducky-bot/urlcatcher"
require 'cinch'
require 'open-uri'
require 'cgi'
require 'json'
require 'uri'

require 'pry'
module DuckyBot
  bot = Cinch::Bot.new do
    configure do |c|
      c.server = "irc.mdx.la"
      c.port = 6668
      c.channels = ["#ducky", "#mdx", "#duckydev"]
      c.nicks = ["ducky", "ducky_doppleganger"]
    end

   helpers do
      def duckduckgo(query)
        url = "http://api.duckduckgo.com/?q=!#{CGI.escape(query)}&format=json&no_redirect=1"
        JSON.parse(open(url).read)["Redirect"] rescue "Quack! Something went wrong, sorry."
      end
    end

# => #<Cinch::Message @raw=":keyvan!keyvan-mdx@internet PRIVMSG #duckydev :http://google.com and another url goo.com foowww.com" @params=["#duckydev", "http://google.com and another url goo.com foowww.com"] channel=#<Channel name="#duckydev"> user=#<User nick="keyvan">>

    # URL Catcher
    on :message, /(https?:\/\/)([-\w]+\.[-\w\.]+)+\w(:\d+)?(\/([-\w\/_\.]*(\?\S+)?)?)*/ do |m|
      # URLCatcher.catch(URI.extract(m.params[1])) unless m.user.nick == bot.nick
    end
    
    # DuckDuckGo
    on :message, /^!(.+)/ do |m, query|
      m.reply duckduckgo(query)
    end
    
    # DEBUG
    if defined? Pry
      on :message, /^pry/ do |m|
        m.reply "Pry activated in the terminal within a response thread."
        binding.pry
      end
    end
  end
  bot.start
end
