load_library :hemesh

module MS  
  include_package 'wblut.math'
  include_package 'wblut.processing'
  include_package 'wblut.hemesh'
  include_package 'wblut.geom'   
end  

attr_reader :mesh, :render, :points, :num   

def setup
  sketch_title 'Sponge'
  ArcBall.init(self)
  rs = MS::WB_RandomOnSphere.new
  @num = 50
  @points = MS::WB_Point[50].new
  50.times.each { |i| points[i] = rs.next_point.mul_self(300.0) }
  creator = MS::HEC_ConvexHull.new
  creator.set_points(points)
  creator.setN(num)
  @mesh = MS::HE_Mesh.new(creator)
  @mesh = MS::HE_Mesh.new(MS::HEC_Dual.new(mesh))
  ext = MS::HEM_Extrude.new.set_chamfer(25).set_relative(false)
  mesh.modify(ext)
  sel = ext.extruded
  ext = MS::HEM_Extrude.new.set_distance(-40)
  mesh.modify_selected(ext, sel)
  mesh.smooth(2)
  @render = MS::WB_Render3D.new(self)
end

def draw
  background(255)
  directional_light(255, 255, 255, 1, 1, -1)
  directional_light(127, 127, 127, -1, -1, 1)
  stroke(0)
  render.draw_edges(mesh)
  no_stroke
  render.draw_faces(mesh)
end

def mousePressed
  rs = MS::WB_RandomOnSphere.new
  creator = MS::HEC_ConvexHull.new
  @num = 50
  @points = MS::WB_Point[50].new
  50.times.each { |i| points[i] = rs.next_point.mul_self(300.0) }
  creator.set_points(points)
  creator.setN(num)
  @mesh = MS::HE_Mesh.new(creator)
  @mesh = MS::HE_Mesh.new(MS::HEC_Dual.new(mesh))
  ext = MS::HEM_Extrude.new.set_chamfer(25).set_relative(false)
  mesh.modify(ext)
  sel = ext.extruded
  ext = MS::HEM_Extrude.new.set_distance(-40)
  mesh.modify_selected(ext, sel)
  mesh.smooth(2)
end   

def settings
  size(800, 800, P3D)
  smooth(8)
end
