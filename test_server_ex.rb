require 'socket'
require_relative 'notes'

server = TCPServer.new(2345)

# socket = server.accept
# socket.puts "What do you say?"
# they_said = socket.gets.chomp
# socket.puts "You said: #{they_said}. Goodbye!"
# socket.close

loop do
  socket = server.accept
  note = Note.new

  loop do
    socket.puts "What would you like to do? Create new, view notes or quit."
    option = socket.gets.chomp

    if option == 'create'
      socket.puts "What is the title?"
      title = socket.gets.chomp

      socket.puts "What is the body?"
      body = socket.gets.chomp
      note.add(title, body)
    elsif option == 'view'
      socket.puts note.list
    elsif option == 'quit'
      break
    end
end

  socket.close
end
