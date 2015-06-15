# Functions. 
# 
# The drawTarget() function makes it easy to draw many distinct targets. 
# rings for each target. 


def setup    
  no_stroke
  no_loop
end

def draw    
  background 51    
  draw_target width * 0.25, height * 0.4, 200, 4
  draw_target width * 0.50, height * 0.5, 300, 10
  draw_target width * 0.75, height * 0.3,  120, 6
end

  greys = 255 / num
  (0...num).each do |i|  		
    fill color(greys * i)
  end
end


def settings
  ellipse x, y, size - i*steps, size - i*steps
end
