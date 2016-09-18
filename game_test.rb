require 'test/unit'
require './game'

class GameTest < Test::Unit::TestCase

  # Utility Methods
  def setup
    @g = Game.new()
  end

  def roll(pins)
    @g.roll(pins)
  end

  def roll_many(times, pins)
    times.times { @g.roll(pins) }
  end

  def roll_spare
    @g.roll(5)
    @g.roll(5)
  end

  def roll_strike
    @g.roll(10)
  end

  # Test Methods
  def test_gutter_game
    roll_many(20,0)
    assert_equal(0, @g.score)
  end

  def test_all_ones
    roll_many(20,1)
    assert_equal(20, @g.score)
  end

  def test_one_spare
    roll_spare
    @g.roll(3)
    roll_many(17,0)
    assert_equal(16, @g.score())
  end

  def test_one_strike
    roll_strike
    @g.roll(3)
    @g.roll(4)
    roll_many(16,0)
    assert_equal(24, @g.score())
  end

  def test_perfect_game
    roll_many(12,10)
    assert_equal(300, @g.score)
  end

  def test_dutch_200
    roll_spare
    roll_strike
    roll_spare
    roll_strike
    roll_spare
    roll_strike
    roll_spare
    roll_strike
    roll_spare
    roll_strike
    roll_spare
    assert_equal(200, @g.score)
  end
end
