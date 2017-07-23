class StorePrinter
  attr_reader :store

  def initialize(store)
    @store = store
  end

  def render
    area = Array.new(@store.width)
    crates = @store.crates
    width = @store.width
    height = @store.height

    (width).times do |row|
      area[row] = Array.new(height)
    end
    crates.each do |crate|
      paint area, with: crate
    end

    (height - 1).downto(0).each do |col|
      printf "%5s" % [col]
      (0..width - 1).each do |row|
        printf "%5s" % [area[row][col]]
      end
      print "\n"
    end

    print " " * 5
    (0..width - 1).each { |i| printf "%5s" % [i] }
    print "\n"
  end
  
  private

  def paint(area, with:)
    crate = with
    marker = crate.product
    slot = crate.allocated_slot

    (slot.start.x..slot.ends.x).each do |row|
      (slot.start.y..slot.ends.y).each do |col|
        area[row][col] = marker
      end
    end
  end
end
