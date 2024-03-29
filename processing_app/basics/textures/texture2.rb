# Texture 2. 
# 
# Using a rectangular image to map a texture onto a triangle.

def setup
  sketch_title 'Texture 2'  
  @img = load_image "berlin-1.jpg"
  no_stroke
end

def draw
  background 0    
  translate width/2, height/2    
  rotate_y map( mouse_x, 0, width, -PI, PI )
  begin_shape
  texture @img
  vertex -100, -100, 0, 0, 0
  vertex 100, -40, 0, @img.width,  @img.height/3
  vertex 0, 100, 0, @img.width/2, @img.height
  end_shape
end

def settings
  size 640, 360, P3D
end
