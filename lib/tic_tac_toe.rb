WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
# Define your WIN_COMBINATIONS constant
def won?(board)
  i=0
  while i < 8
  #  puts i
 win_index = WIN_COMBINATIONS[i]
              if(board[win_index[0]]=="X"  && board[win_index[1]]=="X" && board[win_index[2]]=="X") || (board[win_index[0]]=="O"  && board[win_index[1]]=="O" && board[win_index[2]]=="O")
                     return win_index
             end
  i=i+1
#  count=0
  end
return nil
end
def full?(board)
      !(board.any? {|i|  i ==" "})
     #return !a
 end
def draw?(board)
    full?(board) && (won?(board).class != Array)
end
def over?(board)
   full?(board)
end
def winner(board)
     result = won?(board)
     puts result
      if result.class ==Array
      return board[result[0]]
      else
      return nil
    end
end
def turn_count(board)
  counter=0
  board.each do |element|
    if element =="X" || element =="O"
      counter +=1
     end
   end
   return counter
end
def current_player(board)
   counter=0
  board.each do |element|
    if element =="X" || element =="O"
      counter +=1
    end
  end
        ci=counter.even?
    retval=  ci ?  "X" : "O"
  return retval
end
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end
def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end
def move (board, position, character)
        if character != "O"
           character="X"
        end
       if  board[position.to_i-1] == " "
            board[position.to_i-1]=character
       end
        display_board(board)
end

def valid_move?(board, position)

   if (position.to_i >0  && position.to_i < 10) && board[position.to_i-1] == " "
          return true
   else
      return false
   end
end

  def turn (board)
    position=nil
 # while !valid_move?(board, position)
   #   puts "Please  enter 1-9:"
   #    position = gets.strip

  #end

    if turn_count(board).odd?
       character="X"
     else
       character="O"
    end
    puts (character+"   " + position.to_s )
    puts board
# move(board,position,character)

end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]


      turn(board)

  board = [" ", " ", " ", " ", "X", " ", " ", " ", " "]

      position = "1"
      puts(valid_move?(board, position)) #.to be_truthy

      position = "5"
      puts(valid_move?(board, position))#.to be_falsey

      position = "invalid"
      puts(valid_move?(board, position))#.to be_falsey
