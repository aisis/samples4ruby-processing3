#
# Linear Image. 
# 
# Click and drag mouse up and down to control the signal. 
#
# Note in JRubyArt to access booleans use
#       mouse_pressed? and key_pressed?
#
# Press and hold any key to view the image scanning. 
#

attr_reader :signal, :img, :direction

def setup
  sketch_title 'Linear Image'
  stroke(255)
  @img = loadImage('sea.jpg')
  @direction = 1
  @signal = 0
  img.load_pixels
  load_pixels
end

def draw
  if (signal > img.height - 1 || signal < 0)  
    @direction = direction * -1
  end
  if mouse_pressed? 
    @signal = (mouse_y % img.height).abs
  else 
    @signal += (0.3*direction)
  end

  if key_pressed? 
    set(0, 0, img)
    line(0, signal, img.width, signal)
  else 
    signal_offset = signal.to_i * img.width
    (0 ... img.height).each do |y| 
      java.lang.System::arraycopy(img.pixels.to_java, signal_offset, pixels, y*width, img.width)
    end
    update_pixels
  end
end


def settings
  size(640, 360)
end

