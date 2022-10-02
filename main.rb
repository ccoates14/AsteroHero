require 'ruby2d'
require 'timeout'
require_relative 'hero.rb'
require_relative 'obstacle.rb'
require_relative 'util.rb'

WIDTH = 1600
HEIGHT = 1200

set width: WIDTH, height: HEIGHT, title: "Astero-Hero"

def new_hero
  Hero.new(x: WIDTH / 2, y: HEIGHT / 2, width: 50, height: 50, speed: 1, acc: 0.1)
end

def new_obstacle
  Obstacle.new(x: rand(WIDTH), width: rand(100) + 2, height: rand(200) + 2, speed: rand(2) + 1)
end

hero = new_hero

up = false
down = false
left = false
right = false

score = 0
score_text = Text.new(score.to_s, x: 100, y: 100, size: 40)

obstacles = []

game_over = false

on :key_down do |e|
  k = e.key
  if k == 'up'
    up = true
  elsif k == 'down'
    down = true
  elsif k == 'right'
    right = true
  elsif k == 'left'
    left = true
  elsif k == 'r'
    hero.ship.remove
    hero = new_hero
  end
end

on :key_up do |e|
  k = e.key
  if k == 'up'
    up = false
  elsif k == 'down'
    down = false
  elsif k == 'right'
    right = false
  elsif k == 'left'
    left = false
  end
end

loop_number = 0

update do
  if !game_over
    hero.update

    if up
      hero.up
    elsif down
      hero.down
    elsif right
      hero.right
    elsif left
      hero.left
    end

    loop_number += 1

    if loop_number > 68
      loop_number = 0
      score += 1
      score_text.text = score.to_s
    end

    generate_new_obstacle = rand(11) > 9 && rand(11) > 9

    if generate_new_obstacle || loop_number == 0
      obstacles.push(new_obstacle)
    end

    obstacles.each do |o|
      o.update

      if squares_intersects(hero.ship, o.shape)
        game_over = true
        Text.new('Game Over! Score Total: ' + score.to_s, x: 150, y: HEIGHT / 2, size: 100, color: 'red')
      end
    end

    obstacles = obstacles.select { |o| o.shape.y < HEIGHT}
  end
end

show