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
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(input, default="X")
    @board[input] = default 
  end
  
  def position_taken?(index_value)
    @board[index_value] == " " ? false : true
  end
  
  def valid_move?(index)
    index.between?(0,8) && !position_taken?(index)
  end
  
  def turn
    puts "Please pick a number from 1 through 9"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
      move(index, current_player)
    else  
      turn
    end
    display_board
  end
  
  def turn_count
    count = 0
    @board.map {|move| count +=1 if move != " "}
    count
  end
  
  def current_player
    turn_count%2==0 ? "X" : "O"
  end
  
  def won?
    odp = WIN_COMBINATIONS.detect do |comb|
      @board[comb[0]]=="X" && @board[comb[1]]=="X" && @board[comb[2]]=="X" || @board[comb[0]]=="O" && @board[comb[1]]=="O" && @board[comb[2]]=="O"
        end
  odp ? odp : false
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