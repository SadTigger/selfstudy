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

  def live!
    @live = true
  end

  def dead!
    @live = false
  end

  def show_status
    @live ? '*' : ' '
  end
end

# class Universe
class Universe
  def initialize
    @universe = Array.new(40) { Array.new(20) { Cell.new } }
  end

  def check(cell_x, cell_y)
    count = 0
    cell_x = -1 if cell_x >= @universe.size - 1
    cell_y = -1 if cell_y >= @universe[0].size - 1
    @universe[cell_x - 1][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y - 1].alive? ? count += 1 : count
    @universe[cell_x - 1][cell_y].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y].alive? ? count += 1 : count
    @universe[cell_x - 1][cell_y + 1].alive? ? count += 1 : count
    @universe[cell_x][cell_y + 1].alive? ? count += 1 : count
    @universe[cell_x + 1][cell_y + 1].alive? ? count += 1 : count
    if @universe[cell_x][cell_y].alive?
      if [2, 3].include?(count)
        @universe[cell_x][cell_y].live!
      elsif count < 2 || count > 3
        @universe[cell_x][cell_y].dead!
      else
        puts 'Error'
        exit
      end
    elsif @universe[cell_x][cell_y].dead?
      @universe[cell_x][cell_y].live! if count == 3
    else
      puts 'Dead End'
    end
  end

  def neighborhood
    @universe.each do |row|
      row.each do |col|
        check(@universe.index(row), row.index(col))
      end
    end
    show
  end

  def show
    @universe.map { |row| p row.map(&:show_status) }
  end
end

u = Universe.new
loop do
  sleep 0.45
  system('clear')
  u.neighborhood
end
