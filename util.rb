

def squares_intersects(s1, s2)
  #check if s1 within s2 or s2 within s1

  point_within_square({x: s1.x, y: s1.y}, s2) || point_within_square({x: s1.x + s1.width, y: s1.y}, s2) || point_within_square({x: s1.x, y: s1.y + s1.height}, s2) || point_within_square({x: s1.x + s1.width, y: s1.y + s1.height}, s2) ||
  point_within_square({x: s2.x, y: s2.y}, s1) || point_within_square({x: s2.x + s2.width, y: s2.y}, s1) || point_within_square({x: s2.x, y: s2.y + s2.height}, s1) || point_within_square({x: s2.x + s2.width, y: s2.y + s2.height}, s1)
end

def point_within_square(point, s)
  upper_left_x, upper_left_y = s.x, s.y
  upper_right_x = s.x + s.width
  lower_left_y = s.y + s.height

  point[:x] >= upper_left_x && point[:x] <= upper_right_x && point[:y] >= upper_left_y && point[:y] <= lower_left_y
end