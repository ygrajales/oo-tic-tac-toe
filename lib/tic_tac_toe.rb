

class TicTacToe
    
    def initialize(board = nil)
        @board = board || Array.new(9, ' ')
    end
    
    WIN_COMBINATIONS = [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ] 
    def display_board
        puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
        puts "-----------"
        puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
        puts "-----------"
        puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
    end
    
    def input_to_index(position)
        position.to_i-1 
    end
   
    def move(index, token = "X")
        @board[index] = token
    end
    
    def position_taken?(index)
        @board[index] == "X" || @board[index] == "O"
    end
    
    def valid_move?(index)
        index.between?(0,8) && !position_taken?(index)
    end

    def turn_count

        count = 0

        @board.each do |position|
            if position == "X" || position == "O"
                count += 1
            end
        end

        count
    end

    def current_player
        turn_count % 2 == 0 ? "X" : "O"
    end

    def turn
        puts "\nPlease enter a number from 1 to 9:"

        position = gets.chomp
        
        puts "\n"

        index = input_to_index(position)

        if valid_move?(index)
            move(index, current_player)
            display_board
        else
            turn
        end
    end

    def won?
        WIN_COMBINATIONS.find do |wc|
            if @board[wc[0]]== "X" && @board[wc[1]] == "X" && @board[wc[2]] == "X"
                wc
            elsif @board[wc[0]]== "O" && @board[wc[1]] == "O" && @board[wc[2]] == "O"
                wc
            else
                false
            end
        end
    end

    def full?
        @board.all?{|index| index == "X" || index == "O"}
    end

    def draw?
        # if !won? && full?
        #     true
        # else
        #     false
        # end

        !won? && full? ? true : false
    end

    def over?
        won? || draw?
    end

    def winner

        tokens = won?

        if tokens.kind_of?(Array)
            @board[tokens[0]] == "X" ?  "X" : "O"
        end
    end

    def play

        until over?
            turn
        end

        puts "\n"

        if won?
            puts "Congratulations #{winner}!"
        elsif draw?
            puts "Cat's Game!"
        end

        puts "\n"

    end


end



















