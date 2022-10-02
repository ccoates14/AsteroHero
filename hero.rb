class Hero
  def initialize(x:, y:, width:, height:, speed:, acc:)
    @speed = speed
    @acc = acc
    @rotate_speed = 5

    @ship = Image.new(
            'ship.png',
            x: x, y: y,
            width: width, height: height,
            rotate: 0
          )
  end

  def up
    @speed -= @acc
  end

  def down
    @speed += @acc
  end

  def left
    @ship.rotate -= @rotate_speed
  end

  def right
    @ship.rotate += @rotate_speed
  end

  def keep_ship_within_bounds
    if ship.x < 0
      ship.x = Window.width - ship.width / 2
    elsif ship.x > Window.width
      ship.x = 0
    end

    if ship.y < 0
      ship.y = Window.height - ship.height / 2
    elsif ship.y > Window.height
      ship.y = 0
    end
  end

  def ship
    @ship
  end

  def update
    update_position
    keep_ship_within_bounds
  end

  def update_position
    @ship.x += @speed * Math.cos((@ship.rotate + 90) * Math::PI / 180)
    @ship.y += @speed * Math.sin((@ship.rotate + 90) * Math::PI / 180)
  end

end