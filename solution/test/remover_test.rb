require_relative '../remove/sng_linked_list'
require_relative '../remove/remover'
require 'test/unit'

class RemoverTest < Test::Unit::TestCase

  # initialize new list and remover before each test
  def setup
    @list = SngLinkedList.new
    @remover = Remover.new
  end

  def test_main
    file = File.read(File.expand_path('lists.txt', File.dirname(__FILE__))) # read test data from file
    file.each_line do |line| # each line in the list is a data set for one condition to be checked
      condition, test_data, expected = line.chomp.split("|") # split line of test data into 3 variables
      puts "Checking #{condition} list"
      @list.insert(test_data)
      actualResult = (@remover.mdl_remove @list).to_s.rstrip # convert resulting list into string of values
      assert_equal expected, actualResult
      @list.clear # clear list before next data set to be checked sinse we're inside each_line loop
    end
  end

  def test_empty
    puts 'Checking empty list'
    assert_raise_message('List is empty') do # verify correct exception is thrown
      @remover.mdl_remove @list
    end
  end

  def test_single_node
    puts 'Checking list with single node'
    @list.append(0)
    assert_equal "", (@remover.mdl_remove @list).to_s
  end
end