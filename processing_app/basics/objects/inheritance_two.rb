# Inheritance
# 
# A class can be defined using another class as a foundation. In object-oriented
# programming terminology, one class can inherit fields and methods from another. 
# An object that inherits from another is called a subclass, and the object it 
# inherits from is called a superclass. A subclass extends the superclass.
# NB: note the use of hook means inheriting class does not need to call super


def setup    
  sketch_title 'Inheritance Two'
  @arm = SpinArm.new({ applet: self, x: width/2, y: height/2, s: 0.01 })
  @spots = SpinSpots.new({ applet: self, x: width/2, y: height/2, s: -0.02, d: 90.0 })
end

def draw
  background 204  	
  @arm.display
  @spots.display
end

# vvv CLASS SPIN

class Spin
  
  attr_accessor :x, :y, :speed
  attr_reader :app, :angle
  
  def initialize(args = {})  	    
    @app, @x, @y = args[:applet], args[:x], args[:y]
    @speed = args[:s]
    @angle = args[:angle] || 0.0
    post_initialize(args)  # this is the hook
  end
  
  def update  	    
    @angle += speed
  end
  
  def post_initialize args
    nil
  end
  
end

# ^^^ CLASS SPIN

# vvv CLASS SPINARM

class SpinArm < Spin # inherit from (or "extend") class Spin
  # NB: initialize inherited from Spin class
  
  def display  		
    app.stroke_weight 1
    app.stroke 0  		
    app.push_matrix  		
    app.translate x, y
    update
    app.rotate angle
    app.line 0, 0, 165, 0
    app.pop_matrix
  end  
end

# ^^^ CLASS SPINARM

# vvv CLASS SPINSPOTS

class SpinSpots < Spin    
  attr_accessor :dim
  
  def post_initialize args
    @dim = args[:d]
  end
  
  def display  	    
    app.no_stroke  		
    app.push_matrix  		
    app.translate x, y
    update
    app.rotate angle
    app.ellipse(-dim / 2, 0, dim, dim) 
    app.ellipse(dim / 2, 0, dim, dim)  
    app.pop_matrix
  end  		
end

# ^^^ CLASS SPINSPOTS

def settings
  size 640, 360
end

