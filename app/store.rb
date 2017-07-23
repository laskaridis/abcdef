class Store
  attr_reader :width
  attr_reader :height
  attr_reader :crates

  def initialize(w, h)
    @width = w
    @height = h
    @crates = []
  end

  def available?(slot)
    if slot.ends.x > @width - 1
      return false
    end

    if slot.ends.y > @height - 1
      return false
    end

    allocated_slots = @crates.map(&:allocated_slot)
    allocated_slots.none? { |s| s.overlaps_with?(slot) }
  end

  def store(crate, at:)
    location = at
    slot = crate.slot_at(location)

    if available?(slot)
      crate.allocated_slot = slot
      @crates << crate
      puts "Stored crate with product #{crate.product} at slots #{slot.start} to #{slot.ends}"
    else
      puts "No available space for crate at #{slot.start}"
    end
  end

  def locate(p)
    crate = @crates.find { |c| c.product == p }
    if crate
      slot = crate.allocated_slot
      puts "Product #{p} is located at slots #{slot.start} to #{slot.ends}"
    else
      puts "Could not find product #{p} in store"
    end
  end

  def remove(location)
    crate = @crates.find { |c| c.allocated_slot.contains?(location) }
    unless crate
      puts "No product stored at #{location}"
      return
    end

    @crates.delete(crate)
    puts "Removed product at #{location}"
  end
end
