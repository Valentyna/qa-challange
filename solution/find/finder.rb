class Finder

  def find(list, target)

    if (!target.kind_of? Integer)
      raise 'Target is not integer'
    end

    list.each do |array|
      if array.include?(target)
        return array
      end
    end
    return [] # if int is not found in any of arrays
  end
end
