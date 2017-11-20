require 'command_line_reporter'

class Game
  attr_accessor :player_one, :player_two
  @@pieces_placed = Hash.new

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def move(player)
    puts player.name + " it's your move! Insert one of the follwing numbers to place your piece: #{free_squares}"
    @square = gets.chomp
    @@pieces_placed[@square.to_s.to_sym] = player.piece
    @@pieces_placed
  end

  def board_update_after_last_move(player)
    board = Board.new.create_board @square, player.piece, @@pieces_placed

  end

  def name
    puts @player_one.name
  end

  def free_squares
    squares_to_symbol
    puts "squares array:"
    puts @@free_squares.include?(@square).inspect
    @@free_squares.join(' ')
  end

  def squares_to_symbol
    @@free_squares = (1..9).to_a
    @@free_squares.collect { |e| e.to_s }
    puts @@free_squares.inspect
  end

  def squares_to_hash
    square_hash = Hash.new
    9.times do |i|
      x = (i+1).to_s.to_sym
      square_hash[x] = ''
    end
    square_hash
  end

end

class Board
  include CommandLineReporter

  def create_board square=nil, piece=nil, pieces_placed

    table(border: true) do
      row do
        column(square == :'1' ? piece : pieces_placed[:'1'], width: 10)
        column(square == :'2' ? piece : pieces_placed[:'2'], width: 10)
        column(square == :'3' ? piece : pieces_placed[:'3'], width: 10)
      end
      row do
        column(square == :'4' ? piece : pieces_placed[:'4'])
        column(square == :'5' ? piece : pieces_placed[:'5'])
        column(square == :'6' ? piece : pieces_placed[:'6'])
      end
      row do
        column(square == :'7' ? piece : pieces_placed[:'7'])
        column(square == :'8' ? piece : pieces_placed[:'8'])
        column(square == :'9' ? piece : pieces_placed[:'9'])
      end
    end
  end

end

class Player
  attr_accessor :name, :piece

  def initialize name, piece
    @name = name
    @piece = piece
  end

end



player_one = Player.new 'Kasper', 'X'
player_two = Player.new 'Emil', 'O'
game = Game.new(player_one, player_two)
game.move(player_one)
game.board_update_after_last_move(player_one)
game.move(player_two)
game.board_update_after_last_move(player_two)




=begin

@@free_squares.delete_at(@square - 1) : ''

def initialize(square, free_squares, piece, pieces_placed)
  @square = square
  @free_squares = free_squares
  @piece = piece
  @pieces_placed = pieces_placed
end

puts "pieces_placed:  #{@@pieces_placed}"


  def comparing_previous_moves moves_collection
    squares = squares_to_hash
    squares.each do |key_x, val|
      moves_collection.each do |key_y, val|
        if key_x == key_y
          @@pieces_placed[key_x] = piece
        end
      end
    end

  end

=end
