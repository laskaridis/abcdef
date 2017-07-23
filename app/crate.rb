class Crate
  attr_reader :product
  attr_reader :width
  attr_reader :height
  attr_accessor :allocated_slot

  def initialize(product, width, height)
    @product = product.to_s
    @width = width.to_i
    @height = height.to_i
  end

  def slot_at(location)
    x_offset = location.x + (width - 1)
    y_offset = location.y + (height - 1)
    offset = Location.new(x_offset, y_offset)

    ::Slot.new(location, offset)
  end
end
