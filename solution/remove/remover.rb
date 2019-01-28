require_relative 'sng_linked_list'

class Remover

  def mdl_remove(list)
    size = list.to_a.length

    case size
    when 0 # Check for empty list, if so - raise exception
      raise "List is empty"
    when 1 # Assuming requirement for list with single node is to delete one
      list.clear
      return list
    end

    if size.even?
      return list # Assuming that if there's even number of elements in the list -> do nothing
    end

    # (size / 2) - dividing uneven number by 2 gives whole number - sequence number of the element
    # preceding the one in the middle
    index = size / 2
    list.remove_next(index) # remove element next to the index that passed into method

    return list
  end
end