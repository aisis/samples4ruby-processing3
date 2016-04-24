# encoding: utf-8
# frozen_string_literal: true
load_library :hype
include_package 'hype'
# Access through Hype namespace
module Hype
  java_import 'hype.extended.colorist.HColorPool'
  java_import 'hype.extended.layout.HGridLayout'
end

WEB_COLORS = %w(#FFFFFF #F7F7F7 #ECECEC #0095A8 #00616F #333333 #FF3300 #FF6600).freeze

def settings
  size(600, 600)
end

def setup
  sketch_title 'Color Pool'
  H.init(self)
  H.background(color('#242424'))
  col_int = WEB_COLORS.map { |col| color(col) }
  colors = Hype::HColorPool.new(*col_int)  
  pool = HDrawablePool.new(15_876)
  pool.auto_add_to_stage
      .add(HRect.new(5))
      .layout(Hype::HGridLayout.new.start_x(5).start_y(5).spacing(5, 5).cols(126))
      .on_create do |obj|
        i = pool.current_index
        d = obj.to_java(Java::Hype::HDrawable)
        d.no_stroke.fill(colors.get_color(i))
      end
      .request_all
  H.draw_stage
end
