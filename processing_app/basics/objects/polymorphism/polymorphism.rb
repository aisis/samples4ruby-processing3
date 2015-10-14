# Learning Processing
# Daniel Shiffman
# http://www.learningprocessing.com

# Example 22-2: Polymorphism

# One array of Shapes, in ruby we don't need polymorphism to achieve that
require_relative 'circle'
require_relative 'square'

attr_reader :shps

def setup
  sketch_title 'Polymorphism'
  @shps = []
  30.times do
    if rand < 0.5
      shps << Circle.new(320, 180, 32, color(rand(255), 100))
    else
      shps << Square.new(320, 180, 32)
    end
  end
end

def draw
  background(255)
  shps.each(&:jiggle)
  shps.each { |shape| shape.change_color if shape.respond_to? :change_color }
  shps.each(&:display)
end

def settings
  size(480, 270)
end
