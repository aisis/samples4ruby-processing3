# Description:
# This is a full-screen demo 
# Since processing-3.0a10 set in settings

class FullScreen < Processing::App
  def setup
  sketch_title 'Full Screen'
    no_stroke
  end

  def draw
    lights
    background 0
    fill 120, 160, 220
    (width/100).times do |x|
      (height/100).times do |y|
        new_x, new_y = x * 100, y * 100
        push_matrix
        translate new_x + 50, new_y + 50
        rotate_y(((mouse_x.to_f + new_x) / width) * Math::PI)
        rotate_x(((mouse_y.to_f + new_y) / height) * Math::PI)
        box 90
        pop_matrix
      end
    end
  end  

  def settings
    full_screen P3D
  end
end

