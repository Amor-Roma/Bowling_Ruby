class Game
  attr_accessor :rolls, :current_roll

  def initialize
    @rolls = Array.new()
    @current_roll = 0
    @total_score = 0
  end

  def roll(pins)
    @rolls[@current_roll] = pins
    @current_roll += 1
  end

  def score
    current_ball = 0
    10.times do
      if(is_strike(current_ball))
        strike_frame_score(current_ball)
        current_ball += 1
      elsif(is_spare(current_ball))
        spare_frame_score(current_ball)
        current_ball += 2
      else
        no_mark_frame_score(current_ball)
        current_ball += 2
      end
    end
    @total_score
  end

  def no_mark_frame_score(first_in_frame)
    @total_score += @rolls[first_in_frame] + @rolls[first_in_frame + 1]
  end

  def spare_frame_score(first_in_frame)
    @total_score += 10 + @rolls[first_in_frame + 2]
  end

  def strike_frame_score(first_in_frame)
    @total_score += 10 + @rolls[first_in_frame + 1] + @rolls[first_in_frame + 2]
  end

  def is_strike(first_in_frame)
    @rolls[first_in_frame] == 10
  end

  def is_spare(first_in_frame)
    @rolls[first_in_frame] + @rolls[first_in_frame + 1] == 10
  end

end

