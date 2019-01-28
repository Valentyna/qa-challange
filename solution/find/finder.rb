class Finder

  def find(list, target)
    list.each do |array|
      if array.include?(target)
        return array
      end
    end
    return [] # if int is not found in any of arrays
  end
end