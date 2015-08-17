require 'socket'

class Parser  	
	def self.start(socket, channel, nick)	
		@chan = channel
		@name= nick
		@sock = socket		
	  while @c = socket.gets
	    puts @c	   
	  end
	end		
	
	def self.send(target,string, sock	)
	sock.puts "PRIVMSG #{target} :#{string}\r\n"
	end
	def self.bot()	 
	 if @c.include? "Hello #{@name}" then
	   puts"I see myself"	   
	   #handler(@c)	    
	   #puts '#{@person} said my name in #{@target!}'	   
	   self.send(@chan, "Hello! ", @sock)
	 end 
	end
	def handler(string)
	  #TODO seperate out the nick from string such as 
	  #:Fane!~fane@AAC37028.41324F5E.4414BE08.IP PRIVMSG #Rbtest :Hello Fanebot
	  string.split
	  sender = string[0]
	  sender.split(':', '!')
	  @person = sender[0]
	  @target = string[2]
	end
end




	
		