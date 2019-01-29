require_relative '../find/finder'
require 'test/unit'

class FinderTest < Test::Unit::TestCase

  $finder = Finder.new

  # -----MAIN SCENARIOS------

  def test_first_match_return
    list = [[5, 12, 0.3, 21],
            [12, 12, 12, 12]]
    result = $finder.find(list, 12)
    assert_equal([5, 12, 0.3, 21], result)
  end

  def test_reach_last_array
    list = [[0, 0.1, 2.5.round, 3],
            [4, 0.5510156, 0xD, -5],
            [555555555555, 7, 6, 6],
            [5, 7, 6, 6]]
    result = $finder.find(list, 5)
    assert_equal([5, 7, 6, 6], result)
  end

  # -----EXCEPTIONAL SCENARIOS------

  def test_wrong_parameters
    assert_raise_message('Target is not integer') do
      result = $finder.find(12, 'a')
    end
  end

  def test_empty_list
    list = []
    result = $finder.find(list, 1)
    assert_equal([], result)
  end

  # -----ALTERNATIVE SCENARIOS------

  def test_not_found
    list = [[1, 2, 3, 4],
            [5, 6, 7, 8]]
    result = $finder.find(list, 9)
    assert_equal([], result)
  end

  def test_binary
    list = [[101, 0.5, 50, 6],
            [-0b101, 55, 0xD, -5],
            [0b101, 7, 6, 6]]
    result = $finder.find(list, 5)
    assert_equal([5, 7, 6, 6], result)
  end

  def test_to_int
    list = [[2.5, ~1, 5, 2.5.round],
            ["2".to_i, 0, 4, 6]]
    result = $finder.find(list, 2)
    assert_equal([2, 0, 4, 6], result)
  end

  def test_round
    list = [[2.00001, 1.9, 2.1, 1.5.round],
            [2, 0, 4, 6]]
    result = $finder.find(list, 2)
    assert_equal([2.00001, 1.9, 2.1, 2], result)
  end

  def test_zero
    list = [[nil, false, 'yin', "\0"], # none of these elements will pass condition
            [[].length, 2, 3, 4], # only one element passes condition here
            [0, -0, "0".to_i, 0.0], # all would pass
            [nil.to_i, 0.01.round, 1 - 1, ''.to_i(2)]] # all would pass
=begin
Organising test data this way can prove to be handy when requirements or system behavior changes (let's
say '[].length' shouldn't return 0 anymore) and QA needs to re-do the test.
Having test data structure as above, QA will spend less making up data and updating test.
It also can serve as test oracle for other - more extensive tests.
=end
    result = $finder.find(list, 0)
    assert_equal([0, 2, 3, 4], result)
  end
end
