class Board

    attr_accessor :cells

    def reset!
        self.cells = Array.new(9, " ")
    end

    def initialize
        self.cells = Array.new(9, " ")
    end

    def display
        puts " #{self.cells[0]} | #{self.cells[1]} | #{self.cells[2]} "
        puts "-----------"
        puts " #{self.cells[3]} | #{self.cells[4]} | #{self.cells[5]} "
        puts "-----------"
        puts " #{self.cells[6]} | #{self.cells[7]} | #{self.cells[8]} "
      end 

      def position(input)
      self.cells[input.to_i-1]
      end

      def full?
        self.cells.all? {|cell| cell == "X" || cell == "O"}
      end

      def turn_count
        count = 0
     self.cells.each do | cell| 
      if cell == "X" || cell == "O"
       count += 1
       end
      end
      count
      end

      def taken?(position)
        if self.cells[position.to_i-1] == "X" || self.cells[position.to_i-1] == "O"
            true
        else 
            false
        end
    end

     def valid_move?(position)
        !taken?(position) && position.to_i > 0  && position.to_i <=9
       end

       def update(position,player)
        self.cells[position.to_i-1] = player.token
       end
    
end