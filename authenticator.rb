# hash of users
users = [
          { username: "rob", password: "password1" },
          { username: "paul", password: "password2" },
          { username: "dean", password: "password3" },
          { username: "cat", password: "password4" },
          { username: "jazz", password: "password5" }
        ]

# main method to check hash for match
def auth_user(username, password, list_of_users)
  list_of_users.each do |user_record|
    if user_record[:username] == username && user_record[:password] == password
      attempts = 3
      return user_record
    else
    end
  end
   "Incorrect username or password"
end

# introductory screen
system "clear" or system "cls"
puts "Welcome to the authenticator"
25.times { print "-" }
puts
puts "This program will take an input from the user and compare the respective password"
puts

# loop to set max attempts to 3 then force exit
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

# validating user input vs hash
auth_user_output = auth_user(username, password, users)
attempts -= 1

# output messages for various stages of sucess/failure
if attempts >= 1 && auth_user_output.class == String
  puts auth_user_output
  puts
  puts "You have #{attempts} attempts remaining"
  puts
  puts "Type n to quit or any other key to continue"
end

if attempts == 0 && auth_user_output.class == String
  puts auth_user_output
  puts
  puts "That was your final attempt, the program will now exit"
end

if auth_user_output.class == Hash
  puts "User #{auth_user_output[:username]} authenticated, program will now terminate"
  attempts = -1
end

input = gets.chomp.downcase
system "clear" or system "cls"

# break out of loop if user has chosen to do so early
break if input == "n"
end
