# After a toxiclibs "MeshDoodle" sketch by Karsten Schmidt
# Adapted to use JRubyArt Vec2D and Vec3D classes by Martin Prout
# Note: The extension Vec3D class to support rotations and use of a Struct
# for triangle 'mesh' Face. Also use of AppRenderer for Vec3D => vertex

attr_reader :prev, :p, :q, :rotation, :faces, :pos, :weight, :renderer

Face = Struct.new(:a, :b, :c)

Vec3D.class_eval do # re-open the Vec3D class to add rotation functionality
  def rotate_y(theta)
    co = Math.cos(theta)
    si = Math.sin(theta)
    xx = co * self.x - si * self.z
    self.z = si * self.x + co * self.z
    self.x = xx
    self
  end

  def rotate_x(theta)
    co = Math.cos(theta)
    si = Math.sin(theta)
    zz = co * self.z - si * self.y
    self.y = si * self.z + co * self.y
    self.z = zz
    self
  end
end

def settings
  size(600, 600, P3D)
end

def setup
  sketch_title 'Ribbon Doodle'
  @renderer = AppRender.new(self)
  @weight = 0
  @prev = Vec3D.new
  @p = Vec3D.new
  @q = Vec3D.new
  @rotation = Vec2D.new
  @faces = []
end

def draw
  background(0)
  lights
  translate(width / 2, height / 2, 0)
  rotate_x(rotation.x)
  rotate_y(rotation.y)
  no_stroke
  begin_shape(TRIANGLES)
  # iterate over all faces/triangles of the 'mesh'
  faces.each do |f|
    # create vertices for each corner point
    f.a.to_vertex(renderer)
    f.b.to_vertex(renderer)
    f.c.to_vertex(renderer)
  end
  end_shape
  # update rotation
  @rotation += Vec2D.new(0.014, 0.0237)
end

def mouse_moved
  # get 3D rotated mouse position
  @pos = Vec3D.new(mouse_x - width / 2, mouse_y - height / 2, 0)
  pos.rotate_x(rotation.x)
  pos.rotate_y(rotation.y)
  # use distance to previous point as target stroke weight
  @weight += (sqrt(pos.dist(prev)) * 2 - weight) * 0.1
  # define offset points for the triangle strip
  a = pos + Vec3D.new(0, 0, weight)
  b = pos + Vec3D.new(0, 0, -weight)
  # add 2 faces to the mesh
  faces << Face.new(p, b, q)
  faces << Face.new(p, a, b)
  # store current points for next iteration
  @prev = pos
  @p = a
  @q = b
end
