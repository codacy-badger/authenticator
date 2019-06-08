users = [
          { username: "rob", password: "password1" },
          { username: "paul", password: "password2" },
          { username: "dean", password: "password3" },
          { username: "cat", password: "password4" },
          { username: "jazz", password: "password5" }
        ]

def auth_user(username, password, list_of_users)
  list_of_users.each do |user_record|
    if user_record[:username] == username && user_record[:password] == password
      attempts = 3
      return user_record
    else
      return "Incorrect username or password"
    end
  end
end
system "clear" or system "cls"
puts "Welcome to the authenticator"
25.times { print "-" }
puts
puts "This program will take an input from the user and compare the respective password"
puts "If the password is correct you will get back the user object"
puts

attempts = 3

while attempts > 0
  print "Username: "
  username = gets.chomp
  `stty -echo`
  print "Password: "
  password = gets.chomp
  `stty echo`
  puts ""
  puts

auth_user_output = auth_user(username, password, users)
puts auth_user_output
puts
attempts -= 1

if attempts >= 1 && auth_user_output.class == String
  puts "You have #{attempts} attempts remaining"
  puts
  puts "Press n to quit or any other key to continue"
end

if attempts == 0 && auth_user_output.class == String
  puts "That was your final attempt, the program will now exit"
end

if auth_user_output.class == Hash
  puts "User #{auth_user_output[:username]} authenticated, program will now terminate"
  attempts = -1
end

input = gets.chomp.downcase
system "clear" or system "cls"
break if input == "n"
end
