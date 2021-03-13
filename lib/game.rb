class Game

    attr_accessor :board, :player_1 , :player_2 

    def initialize(player_1= Players::Human.new("X"),player_2=Players::Human.new("O") , board = Board.new)
        @player_1 = player_1
        @player_2 = player_2
        @board = board
     end

        WIN_COMBINATIONS= [
        [0,1,2],
        [3,4,5],
        [6,7,8],
        [0,3,6],
        [1,4,7],
        [2,5,8],
        [0,4,8],
        [2,4,6]
    ]

    def current_player
         board.turn_count % 2 == 0 ? player_1 : player_2
        #binding.pry
    end

    def won?
        WIN_COMBINATIONS.each do  |win_combo|
            position_1 = self.board.cells[win_combo[0]]
            position_2 = self.board.cells[win_combo[1]]
            position_3 = self.board.cells[win_combo[2]]
        #binding.pry
           if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||  (position_1 == "O" && position_2 == "O" && position_3 == "O")
             return win_combo
            end
        end
          return false
    end
    
        def draw?
            if !won? && @board.full?
                return true
            else 
                false
            end
        end

        def over?
            if draw? || won?
                return true
            else
                false
            end
        end

    def winner
        combo = won?
        if combo == false
          return nil
        end
        #binding.pry
        if self.board.cells[combo[1]] == "X"
        return "X"
        else 
         "O"
        end
    end
     
    def turn
        puts " enter a number 1-9:"
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
      @board.display
      turn
    end
    @board.display
    end

    def play
        until over?
            turn
          end
          if won?
            puts "Congratulations #{winner}!"
          elsif draw?
            puts "Cat's Game!"
          end

    end



end