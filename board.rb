require_relative 'knight'

class Board
  attr_accessor :positions, :knight
  attr_reader :knight_display

  def initialize
    @knight = nil
    @knight_display = '♞'
    @positions = Array.new(8) { Array.new(8, nil) }
  end

  def display_board
    puts '   +----+----+----+----+----+----+----+----+'
    @positions.each_index do |row|
      print "#{row}  "
      @positions[row].each_index do |column|
        if @positions[row][column].nil?
          print "|    "
        else
          print "| #{@positions[row][column]}  "
        end
      end
      puts "|"
      puts '   +----+----+----+----+----+----+----+----+'
    end

    print "   "
		(0..7).each { |letter| print "  #{letter}  "}
		puts ""
  end

  def add_knight(row, column)
    @positions[row][column] = @knight_display
    @knight = Knight.new(row, column)
  end

  def move_knight(row, column)
    possible_moves = knight.find_possible_moves
    if [row, column] in possible_moves
      @positions[@knight.row][knight.column] = nil
      @knight.row = row
      @knight.column = column
      @positions[@knight.row][knight.column] = @knight_display
      knight.possible_moves = knight.find_possible_moves
    end
  end
end

board = Board.new
board.display_board
board.add_knight(0, 3)
board.display_board