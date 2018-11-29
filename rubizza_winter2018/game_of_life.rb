# frozen_string_literal: true

# game of life v 0.0001

# x - 1, y - 1 | x, y - 1 | x + 1, y - 1

# x - 1, y     | x,    y  | x + 1, y

# x - 1, y + 1 | x, y + 1 | x + 1, y + 1

# class Cell
class Cell
  def initialize
    @live = [true, false].sample # [' ', '*'].sample
  end

  def alive?
    @live
  end

  def dead?
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

# class Universe
class Universe
  def initialize
    @universe = Array.new(3) { Array.new(3) { Cell.new } }
  end

  def check(cell_x, cell_y)
    count = 0
    @universe[cell_x - 1][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x - 1][cell_y].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y].alive? ? count += 1 : count
    @universe[cell_x - 1][cell_y + 1].alive? ? count += 1 : count
    @universe[cell_x][cell_y + 1].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y + 1].alive? ? count += 1 : count
    case
    when count == 2, 3 && @universe[cell_x][cell_y].alive?
      @universe[cell_x][cell_y].live
    when count < 2 || count > 3
      @universe[cell_x][cell_y].dead
    else
      puts 'Error'
    end
  end

  def universe
    @universe[0][0]
  end

  def neighborhood
    @universe.each { |row| row.each &.check(@universe[0][0]) }
  end

  def show
    @universe.map { |row| row.map { |el| el.show_status } }
  end
end
