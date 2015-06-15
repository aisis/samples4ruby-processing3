# Distance 2D. 
# 
# Move the mouse across the image to obscure and reveal the matrix.  
# Measures the distance from the mouse to each square and sets the

def setup    
  no_stroke
  @max_distance = dist(0, 0, width, height)    
end

def draw  
  background 51  
  (0..width).step(20) do |i|  	
    (0..height).step(20) do |j|  		
    end
  end  
end

def settings
  ellipse i, j, size, size
end
