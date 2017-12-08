require "minitest/autorun"
require_relative "rocket"

class RocketTest < Minitest::Test
  # Write your tests here!

  def setup
    @rocket = Rocket.new({name: "Apollo 7", colour: "Grey"})
  end

  def test_rocket_start_name
    result = @rocket.name
    assert_equal "Apollo 7", result
  end

  def test_rocket_start_colour
    result = @rocket.colour
    assert_equal "Grey", result
  end

  def test_rocket_name_change
    result = @rocket.name=("Jacob")
    assert_equal "Jacob", result
  end

  def test_rocket_colour_change
    result = @rocket.colour=("Grey")
    assert_equal "Grey", result
  end

  def test_flying?
    result = @rocket.flying?
    refute result
  end

  def test_flying_after_lift_off
    @rocket.lift_off
    result = @rocket.flying?
    assert result
  end

  def test_lift_off_if_flying
    @rocket = Rocket.new({flying:true})
    result = @rocket.lift_off
    refute result
  end


  def test_flying_after_landing
    @rocket.lift_off
    result = @rocket.land
    assert result
    refute @rocket.flying?
  end

  def test_status_if_landing
    result = @rocket.status
    expected = "Rocket #{@rocket.name} is ready for lift off!"
    assert_equal result, expected
  end

  def test_status_if_flying
    @rocket.lift_off
    result = @rocket.status
    expected = "Rocket #{@rocket.name} is flying through the sky!"
    assert_equal result, expected
  end

end
