require 'socket'
require_relative 'parsing'
class RbIRC
	#The main class
	#
	#Example 
	#  >>RbIRC.start("irc.rizon.net", "MyNick", "#YourFavouriteChannel")
	#  It should connect after that and will start showing essentially raw IRC
  #TODO multi-channel support(*chan)
	 attr_accessor :sock
	def self.start(server, nick, channel, bot = true)
	  
	  puts "Starting connect to #{server} with nick #{nick}"
		sock = TCPSocket.new(server, 6667)
		while stuff = sock.gets
		if stuff.include? "439"			
		  sock.puts "USER #{nick} #{nick} #{nick} :#{nick}\r\n", 'UTF-8'
			sock.puts "NICK #{nick}\r\n" , 'UTF-8'	
			sock.puts "JOIN #{channel}\r\n"			
		end
    Parser.start(sock, channel, nick)
		if bot == false
            next
          else 
            Parser.bot()      
          end         
		end			
		while line = sock.gets
			if  line.include? "PING"	
				ping = Array.new
				ping = line.split(':')
				sock.puts "PONG : #{ping[1]}\r\n"
			end				
		end	
	end
end
RbIRC.start('irc6.rizon.net', 'Fanebot', '#Rbtest')
