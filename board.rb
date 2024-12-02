class Board
  def initialize
    @knight = '♞'
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
end

board = Board.new
board.display_board