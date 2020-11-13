 require_relative '../lib/tic_tac_toe.rb'
 require "pry"
    #binding.pry 
   
   
 def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


def play(board)
  until over?(board)
   turn(board) 
  end 
   if winner(board) puts "Game over."
   puts "Congratuations, #{winning value}""
   if draw?(board)
     puts "Cat's Game"
   
end 
end 



def turn(board)
  puts "Please enter 1-9:"
  user_input = gets.chomp
  index = input_to_index(user_input)
  if valid_move?(board, index)
     value = current_player(board)
    move(board, index, value = "X")
  display_board(board) 
else 
  turn(board)
  end 
end 


def input_to_index(user_input)
  user_input.to_i-1 
end 
  

def move(board, index, value)
  board[index] = value 
  if value != "X" && value != "O" 
    puts "Error."
  end    
end   
  

  
def valid_move?(board, index)
  if index.between?(0,8) && !position_taken?(board, index)
    true
  end 
end 



def turn_count(board) 
  count = 0 
  board.each do |entry| 
    if entry == "X" || entry == "O"
      count +=1 
    end 
end 
count 
end 
 

def current_player(board) 
  count = turn_count(board)
  if count % 2 == 0 
      turn = "O" 
  else  
    turn = "X" 
  end   
end   
      
      
    def position_taken?(board, index)
      if board[index] ==  nil || board[index] == " "
        return false 
      else
      return true  
        end 
    end 
    
   
    WIN_COMBINATIONS = [
      [0, 1, 2],  
      [3, 4, 5],
      [6, 7, 8],
      [0, 3, 6],
      [1, 4, 7],
      [2, 5, 8],
      [0, 4, 8], 
      [6, 4, 2],     
      ]
  
  def won?(board)
       WIN_COMBINATIONS.detect do |array|
       index_1 = array[0]
       index_2 = array[1]
       index_3 = array[2]
     
     position_1 = board[index_1] 
     position_2 = board[index_2]
     position_3 = board[index_3] 
     
        
      if position_1 == position_2 && position_2 == position_3 && (position_1 == "X" || position_1 == "O")
      return array
      end 
     end 
     return false 
  end  

     
    def full?(board) 
      if board.all?{|index| index == "X" || index == "O" || !board.all? == " "}
        return true 
      else
        return false 
    end
  end 
    
    def draw?(board)
      if full?(board) && !won?(board)
      return true  
      elsif !full?(board) && !won?(board)
      return false 
    else
      return false 
    end
  end 
    
    
    def over?(board)
      won?(board) || full?(board)
    end 
    
    
 def winner(board)
         winning_value = won?(board)
         if winning_value 
           board[winning_value[0]]
         end 
  end  