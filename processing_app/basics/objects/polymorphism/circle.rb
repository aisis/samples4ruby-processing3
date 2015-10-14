# Learning Processing
# Daniel Shiffman
# http://www.learningprocessing.com

# Example 22-2: Polymorphism
require_relative 'shape'
# Circle class inherits Processing:Proxy module methods from Shape
class Circle < Shape
  # Inherits all instance variables from parent + adding one
  attr_reader :c, :x, :y, :r

  def initialize(x, y, r, c)
    super           # Call the parent constructor
    @c = c          # Also deal with this new instance variable
  end

  # Call the parent jiggle, but do some more stuff too
  def jiggle
    super
    # The Circle jiggles both size and location.
    @r += rand(-1..1.0)
    @r = constrain(r, 0, 100)
  end

  # The change_color function is unique to the Circle class.
  def change_color
    @c = color(rand(255))
  end

  def display
    ellipse_mode(CENTER)
    fill(c)
    stroke(0)
    ellipse(x, y, r, r)
  end
end
