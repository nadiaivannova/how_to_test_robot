require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_neeing_repairs_sent_to_station_1
    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = true
    broken_robot.foreign_model = true
    #act
    result = broken_robot.station
    # assert
    assert_equal(result, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2

    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = true
    broken_robot.vintage_model = true
    # act
    result = broken_robot.station
    # assert
    assert_equal(result, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3

    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = true

    # act
    result = broken_robot.station
    # assert
    assert_equal(result, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4

    # arrange
    broken_robot = Robot.new
    broken_robot.needs_repairs = false
    # act
    result = broken_robot.station
    # assert
    assert_equal(result, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one

    # arrange
    lazy_robot = Robot.new
    lazy_robot.todos = []

    # act
    result = lazy_robot.prioritize_tasks

    # assert
    assert_equal(result, -1)

  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value

    # arrange
    busy_robot = Robot.new
    busy_robot.todos = [1, 2, 9, 4, 4]
    # act
    result = busy_robot.prioritize_tasks
    # assert
    assert_equal(result, 9)
  end

  def test_workday_on_day_off_returns_false

    # arrange
    happy_robot = Robot.new
    happy_robot.day_off = 'monday'
    # act
    result = happy_robot.workday?('monday')
    # assert
    assert_equal(result, false)
  end

  def test_workday_not_day_off_returns_true

    # arrange
    sad_robot = Robot.new
    sad_robot.day_off = 'monday'
    # act
    result = sad_robot.workday?('tuesday')
    # assert
    assert_equal(result, true)
  end

end
