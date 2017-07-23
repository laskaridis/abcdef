class Slot
  attr_reader :start
  attr_reader :ends

  def initialize(start, ends)
    if start.x < 0 || start.y < 0
      raise "slots should start at point (0,0)"
    end

    @start = start
    @ends = ends
  end

  def overlaps_with?(slot)
    contains?(slot.start) || contains?(slot.ends)
  end

  def contains?(location)
    location.x >= start.x &&
    location.y >= start.y &&
    location.x <= ends.x &&
    location.y <= ends.y
  end
end
