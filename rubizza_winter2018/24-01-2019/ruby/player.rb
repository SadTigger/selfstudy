class Player
  # initialize your player
  def initialize
    @counter = 0
    @first_pos = 1
    @second_pos = 2
    @third_pos = 3
    @forth_pos = 4
    @figure = ''
  end

  # process data for each event from tetris-server
  def process_data(data)
    # p data
    @figure = 'stick' if data.include?("figure=I")
    @figure = 'brick' if data.include?("figure=O")
  end

  # This method should return string like left=0, right=0, rotate=0, drop'
  def make_step
    p "lv1 #{@counter}"
    if @figure == 'brick'
      @counter += 1
      if @first_pos == @counter
        "left=4, drop"
      # elsif @second_pos == @counter
      #   "left=2, drop"
      # elsif @third_pos == @counter
      #   "right=0, drop"
      else
        # "drop"
        # @first_pos += 1
        # @second_pos += 1
        @counter = 0
      end
    elsif @figure == 'stick'
      "rotate=1, right=#{[0,6].sample}, drop"
    end
  end
end
