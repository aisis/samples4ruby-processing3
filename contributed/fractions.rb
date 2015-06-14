# fractions.rb, by Martin Prout
attr_reader :f, :add, :subtract, :multiply

def setup
  sketch_title 'Math Blackboard'
  @f = createFont('Arial', 24, true)
  third = 1 / 3r     # since ruby 2.1.0 (and jruby-9.0.0.0)
  quarter = 1 / 4r
  format_add = '%s + %s = %s'
  format_sub = format_add.gsub('+', '-')
  format_mult = format_add.gsub('+', '*')
  @add = format(format_add, third, quarter, third + quarter)
  @subtract = format(format_sub, third, quarter, third - quarter)
  @multiply = format(format_mult, third, quarter, third * quarter)
end

def draw
  background 10
  text_font(f, 24)
  fill(220)
  text('Math Blackboard Ruby-Processing-3.0', 80, 50)
  text(add, 110, 100)
  text(subtract, 110, 150)
  text(multiply, 110, 200)
end

def settings
  size 640, 250, FX2D
  smooth 4
end
