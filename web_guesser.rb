require 'sinatra'
require 'sinatra/reloader'

number = rand(100)

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
 erb :index, :locals => {:number => number, :guess => guess, :check_guess => check_guess}
end