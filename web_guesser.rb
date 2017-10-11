require 'sinatra'
require 'sinatra/reloader'

number = rand(100)
color_var = '#0000FF'

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

get '/' do
 guess = params["guess"]
 check_guess = high(guess.to_i,number)
 color = switch_c(guess,number)
 erb :index, :locals => {:number => number, :guess => guess, :check_guess => check_guess, :color_var => color_var, :color => color}
end

