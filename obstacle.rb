class Obstacle
  def initialize(x:, width:, height:, speed:)
    @rectangle = Rectangle.new(x: x, y: 0, width: width, height: height, color: 'white')
    @speed = speed
  end

  def shape
    @rectangle
  end

  def update
    shape.y += @speed
  end
end