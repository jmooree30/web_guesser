require 'sinatra'
require 'sinatra/reloader'
 
color_var = '#0000FF'
@@number = rand(100)
@@counter = 5
@@message = "Please try again."

def switch_c(guess,number)
  if guess.to_i > number + 5
    color_var = '#0000FF'
  elsif guess.to_i < number - 5
    color_var = '#0000FF'
  elsif guess.to_i > number
    color_var = '#00FFFF'
  elsif guess.to_i < number
    color_var = '#00FFFF' 
  else guess.to_i == number
    color_var = "green"
  end
end 

def high(guess,number)
  if guess.to_i > number + 5
    guess = "way to high!"
  elsif guess.to_i < number - 5
    guess = "Way to low bro!"
  elsif guess.to_i > number
    guess = "To high!"
  elsif guess.to_i < number
    guess = "To low!"
  else guess.to_i == number
    guess = "Correct! The secret number is #{number}!"
  end
end 

def reset(message,number,counter)
  if @@counter == 0
    @@number = rand(100)
    @@counter = 5
    @@message = "Please try again"
  end
end 

get '/' do
 @@counter -=1 
 guess = params["guess"]
 check_guess = high(guess.to_i,@@number)
 color = switch_c(guess,@@number)
 try_again = reset(@@message,@@number,@@counter)
 erb :index, :locals => {:guess => guess, :check_guess => check_guess, :color_var => color_var, :color => color, :try_again => try_again}
end

