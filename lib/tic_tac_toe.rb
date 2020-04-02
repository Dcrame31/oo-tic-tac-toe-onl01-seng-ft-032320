class TicTacToe
  
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
    ]

  
  def initialize()
    @board =  Array.new(9," ")
  end
  
  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end
  
  def input_to_index(user_input)
    user_input.to_i - 1
  end
  def move(index, current_player)
    @board[index] = current_player
  end
  def position_taken?(location)
    @board[location] != " " && @board[location] != ""
  end

  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index,current_player)
      display_board
    else
      turn
    end
  end
  
  def turn_count
    count = 0
    @board.map {|move| count +=1 if move != " "}
    count
  end
  
  def current_player
    turn_count.even?== true? "X" : "O"
  end
  
  def won?
   board_index_X = @board.each_index.select {|index| @board[index] == "X"}
   board_index_O = @board.each_index.select {|index| @board[index] == "O"}

    winning_combinations_x = WIN_COMBINATIONS.map do |index| 
      index.select {|num| board_index_X.include?(num)}
    end

    winning_combinations_o = WIN_COMBINATIONS.map do |index|
      index.select {|num| board_index_O.include?(num)}
    end

    winning_arrays_x = winning_combinations_x.select{|array|array.length > 2}
    winning_arrays_o = winning_combinations_o.select{|array|array.length > 2}
    winning_arrays = winning_arrays_o + winning_arrays_x
    if winning_arrays == []
      false
    else winning_arrays.flatten
    end
  end
  
  def full?
    @board.none? {|s| s == " "}
  end
  
  def draw?
    if full? && !won?
      true
    elsif won?
      false
    elsif !full? && !won?
      false
    end
  end
  
  def over?
    true if won? || full?
  end
  
  def winner
     board_index_X = @board.each_index.select {|index| @board[index] == "X"}
     board_index_O = @board.each_index.select {|index| @board[index] == "O"}

    winner_X = WIN_COMBINATIONS.map do |index| 
      index.all? {|num| board_index_X.include?(num)}
    end
    
    winner_O = WIN_COMBINATIONS.map do |index| 
      index.all? {|num| board_index_O.include?(num)}
    end
      x = winner_X.any? {|x| x == true}
      o =winner_O.any? {|o| o == true} 
      if x && o == true
        false
    elsif
        o == true
      "O"
    elsif 
        x == true 
      "X"
    else
    end
  end
  
  def play
    until over? == true
    turn
    draw?
    won?
    end
      if won? != false
        puts "Congratulations #{winner}!"
      elsif
        draw? == true
        puts "Cat's Game!"
    end
  end
  
end