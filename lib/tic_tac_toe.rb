class TicTacToe
  attr_accessor :board

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 4, 8], [6, 4, 2], [0, 3, 6], [1, 4, 7], [2, 5, 8]]

  def initialize
    @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end

  def display_board
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts "------------"
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts "------------"
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def input_to_index(input_string)
    input_string.to_i - 1
  end

  def move(index, token = "X")
    board[index] = token
  end

  def position_taken?(index)
    board[index] != " "
  end

  def valid_move?(index)
    index >= 0 && index < 11 && !position_taken?(index)
  end

  def turn_count
    count = 0
    board.each do |space|
      if space == "X" || space == "O"
        count += 1
      end
    end
    count
  end

  def current_player
    turn_count.even? ? "X" : "O"
  end

  def turn
    move = gets.chomp
    index = input_to_index(move)
    if valid_move?(index)
      move(index, current_player)
      display_board
    else
      turn
    end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
        return combo
      end
    end
  end

  def full?
    board.all? { |space| space == "X" || space == "O" }
  end

  def draw?
    full? && !won?
  end

  def over?
    draw? || won?
  end

  def winner
    if won?
      WIN_COMBINATIONS.each do |combo|
        if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
          return board[combo[0]]
        end
      end
    end
  end

  def play
    turn until over?

    if won? 
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end 

  end


end













# class TicTacToe
#     attr_accessor :board

#     WIN_COMBINATIONS =  [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

#     def initialize
#         @board = [" "," "," "," "," "," "," "," "," "]

#     end

#     # HELPER METHODS

#     def display_board
#         puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
#         puts "-----------"
#         puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
#         puts "-----------"
#         puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
#     end

#     def input_to_index(num_str)
#         num_str.to_i - 1
#     end

#     def move(index, token = "X")
#         @board[index] = token
#     end

#     def position_taken?(index)
#         @board[index] != " "
#     end

#     def valid_move?(index)
#         index.between?(0, 8) && !position_taken?(index)
#     end

#     def turn_count
#         @board.count{|square| square != " "}
#     end

#     def current_player
#         turn_count.even? ? "X" : "O"
#     end

#     def turn
#         puts "Please enter a number (1-9):"
#         user_input = gets.strip
#         index = input_to_index(user_input)
#         if valid_move?(index)
#             token = current_player
#             move(index, token)
#         else
#             turn
#         end
#         display_board
#     end

#     def won?
#         WIN_COMBINATIONS.any? do |combo|
#             if position_taken?(combo[0]) && @board[combo[0]] == @board[combo[1]] && @board[combo[1]] == @board[combo[2]]
#                 return combo
#             end
#         end
#     end

#     def full?
#         @board.all? {|square| square != " "}
#     end

#     def draw?
#         full? && !won?
#     end

#     def over?
#         won? || draw?
#     end

#     def winner
#         if combo = won?
#             @board[combo[0]]
#         end
#     end

#     # GAME METHODS

#     def play
#         turn until over?
#         puts winner ? "Congratulations #{winner}!" : "Cat's Game!"
#     end

# end
