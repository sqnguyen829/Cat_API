# require_relative '../config/environment'
$prompt = TTY::Prompt.new

def start_app
    #puts "\e[H\e[2J" clears the terminal
    puts "\e[H\e[2J"
    puts 'Welcome to Create your Cat Collection!'
    $prompt.select("What would you like to do?") do |menu|
        menu.choice 'Log In', -> {login}
        menu.choice 'Sign Up', -> {signup}
        menu.choice 'Close App', -> {close_app}
    end
end

def login
    puts "\e[H\e[2J"
    name = $prompt.ask('What is your username?', default: ENV['USER'])
    current_user = User.all.find {|user| user.username == name}
    if current_user != nil
        password_check(current_user)
    else
        puts "\e[H\e[2J"
        $prompt.select("The username you typed does not exit.") do |menu|
            menu.choice 'Sign Up', -> {signup}
            menu.choice 'Try logging again', -> {login}
            menu.choice 'Return to menu', -> {start_app}
        end
    end
end

def password_check(current_user)
    password = $prompt.mask("What is your password?")
    if current_user.password != password
        puts "\e[H\e[2J"
        $prompt.select("The password you typed is wrong!") do |menu|
            menu.choice 'Re-enter password', -> {password_check(current_user)}
            menu.choice 'Return to menu', -> {start_app}
        end
    end
end

def signup
    puts "\e[H\e[2J"
    puts "Sign up page."
    name = $prompt.ask('Username: ', default: 'USER')
    check_username = User.all.find {|user| user.username == name}
    if check_username != nil || check_username == 'USER'
        puts "\e[H\e[2J"
        $prompt.select("That username has already been taken") do |menu|
            menu.choice 'Sign up with a different username', -> {signup}
            menu.choice 'Return to menu', -> {start_app}
        end
    end
    password_confirmation(name)
end

def password_confirmation(name)
    password = $prompt.mask("Password : ", default: ENV['fakePW'])
    confirm_password = $prompt.mask("Confirm Pw: ")
    if confirm_password == password
        User.create(username: name, password: password)
    else
        puts "\e[H\e[2J"
        $prompt.select("Your password does not match") do |menu|
            menu.choice 'Re-enter password', -> {password_confirmation(name)}
            menu.choice 'Return to menu', -> {start_app}
        end
    end
end

def close_app
    puts 'close app'
end

start_app

