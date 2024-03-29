# Texture 1. 
# 
# Load an image and draw it onto a quad. The texture() function sets
# the texture image. The vertex() function maps the image to the geometry.


def setup 
  sketch_title 'Texture 1' 
  @img = load_image "berlin-1.jpg"  
  no_stroke  
end

def draw  
  background 0  
  translate width/2, height/2
  rotate_y map(mouse_x, 0, width, -PI, PI)
  rotate_z PI/6
  
  begin_shape  
  texture @img  
  vertex(-100, -100, 0, 0, 0)
  vertex(100, -100, 0, @img.width, 0)  
  vertex(100, 100, 0, @img.width, @img.height)  
  vertex(-100, 100, 0, 0, @img.height) 
  end_shape
  
end
  

def settings
  size 640, 360, P3D
end
