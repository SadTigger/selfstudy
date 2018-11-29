# game of life v 0.0001

# x - 1, y - 1 | x, y - 1 | x + 1, y - 1

# x - 1, y     | x,    y  | x + 1, y 

# x - 1, y + 1 | x, y + 1 | x + 1, y + 1


class Cell

  def initialize
    @live = [true, false].sample # [' ', '*'].sample
  end
  
  def is_alive?
    @live
  end
  
  def is_dead?
    !@live
  end
  
  def live
    @live = true
  end
  
  def dead
    @live = false
  end
  
  def show_status
    @live
  end
end

class Universe
	def initialize
	  @universe = Array.new(3) { Array.new(3) { |i| i = Cell.new } }
	end
	
	def check(cell = @universe[0][0], cell_x = 0, cell_y = 0, world = @universe)
	  count = 0
	  @universe[cell_x - 1][cell_y - 1].is_alive? ? count += 1 : count
	  @universe[cell_x][cell_y - 1 ].is_alive? ? count += 1 : count
	  @universe[cell_x + 1 ][cell_y - 1 ].is_alive? ? count += 1 : count
	  @universe[cell_x - 1 ][cell_y].is_alive? ? count += 1 : count
	  @universe[cell_x + 1 ][cell_y].is_alive? ? count += 1 : count
	  @universe[cell_x - 1 ][cell_y + 1 ].is_alive? ? count += 1 : count
	  @universe[cell_x][cell_y + 1 ].is_alive? ? count += 1 : count
	  @universe[cell_x + 1 ][cell_y + 1 ].is_alive? ? count += 1 : count
	  case  
	    when count == 2, 3 && cell.is_alive? 
            cell.live
        when count < 2 || count > 3 
            cell.dead
		else 
		  puts "Error"
	  end
	  
	end
	
	def universe
	  @universe[0][0]
	end
	
	def neighborhood
      @universe.each { |row|  row.each { |element| element.check }} 
    end
	
	def show
	  @universe.map { |row| row.map { |el| el.show_status } }
	end
end