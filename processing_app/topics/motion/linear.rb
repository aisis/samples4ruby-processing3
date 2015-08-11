#
# Linear Motion.
#
# Changing a variable to create a moving line.
# When the line moves off the edge of the window,
# the variable is set to 0, which places the line
# back at the bottom of the screen.
#
attr_reader :a

def setup
  sketch_title 'Linear'
  stroke(255)
  @a = height / 2
end

def draw
  background(51)
  line(0, a, width, a)
  @a = a - 0.5
  return unless a < 0
  @a = height
end

def settings
  size(640, 360)
end