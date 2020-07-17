class Game
	attr_accessor :pl_x, :pl_o
	def initialize(pl_x, pl_o)
		@pl_x = pl_x
		@pl_o = pl_o
		@board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
		@winner = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
	end

	def display_board
		puts "  #{@board[0]} | #{@board[1]} | #{@board[2]}"
		puts "  --+---+---"
		puts "  #{@board[3]} | #{@board[4]} | #{@board[5]}"
		puts "  --+---+---"
		puts "  #{@board[6]} | #{@board[7]} | #{@board[8]}"
		puts ""
	end

	def add_positions(piece, pos)
		if pos < 1 || pos > 9 || @board[pos-1] == "X" || @board[pos-1] == "O"
			false
		else
			@board[pos-1] = piece
			true
		end
	end

	def check_winner
		@winner.each do |pos|
			if @board[pos[0]] == @board[pos[1]] && @board[pos[1]] == @board[pos[2]] && (@board[pos[0]] == "X" || @board[pos[0]] == "O")
				if @board[pos[0]] == "X"
					puts "#{pl_x} have won the game!!!"
				else
					puts "#{pl_o} have won the game!!!"
				end
				return true
			end
		end
		return false
	end
end

choice = "y"
while choice == "y" do
	puts "Welcome to Tic-Tac-Toe"
	puts ""

	puts "Enter player X's name:"
	pl_x = gets.chomp
	puts ""

	puts "Enter player O's name:"
	pl_o = gets.chomp
	while pl_o == pl_x do
		puts "#{pl_x} is already taken. Please enter a valid name:"
		pl_o = gets.chomp
	end
	puts ""

	game = Game.new(pl_x, pl_o)
	turn = true
	is_playing = true

	# Game loop
	while is_playing do
		# Printing board to the screen
		game.display_board

		if turn
			turn = false
			while true do
				puts "It is #{game.pl_x}'s - (X) turn. Enter a valid position(1-9)"
				pos = gets.chomp.to_i
				if game.add_positions("X", pos)
					break
				end
			end
		else
			turn = true
			while true do
				puts "It is #{game.pl_o}'s - (O) turn. Enter a valid position(1-9)"
				pos = gets.chomp.to_i
				if game.add_positions("O", pos)
					break
				end
			end
		end

        if game.check_winner
            puts ""
            game.display_board
            puts ""
			is_playing = false
		end
	end

	choice = nil
	while choice != "y" && choice != "n"
		puts "Would you like to start a new game?(y/n)"
		choice = gets.chomp.downcase
	end

end