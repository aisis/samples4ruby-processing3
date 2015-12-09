# uber simple Homogeneous 4 x 4 matrix
require 'matrix'

class Mat4
  attr_reader :mat

  def initialize(axisX, axisY, axisZ, trans)
    @mat = Matrix[
    [axisX.x, axisY.x, axisZ.x, trans.x],
    [axisX.y, axisY.y, axisZ.y, trans.y],
    [axisX.z, axisY.z, axisZ.z, trans.z],
    [0, 0, 0, 1]
    ]
  end

  # The processing version changes the input 'array', here we return
  # a new array with transformed values (which we then assign to the input)
  # see line 89 Frame_of_Reference.rb

  def mult(array)
    array.map.each do |arr|
      matrix_to_vector(mat * Matrix[[arr.x], [arr.y], [arr.z], [1]])
    end
  end

  private

  # I isn't obvious but we only require first 3 elements
  def matrix_to_vector(vec)
    Vec3D.new(vec.column(0)[0], vec.column(0)[1], vec.column(0)[2])
  end
end
