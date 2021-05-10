require "./yuy"

module PixFmt
  module Conversions
    module YUYV
      def self.to_rgb(y1 : Float32, u : Float32, y2 : Float32, v : Float32) {Float32, Float32, Float32, Float32, Float32, Float32}
        r1, g1, b1 = YUV.to_rgb(y1,u,v)
        r2, g2, b2 = YUV.to_rgb(y2,u,v)

        return {r1, g1, b1, r2, g2, b2}
      end

      def self.to_rgb(y1 : UInt8, u : UInt8, y2 : UInt8, v : UInt8) {UInt8, UInt8, UInt8, UInt8, UInt8, UInt8}
        r1, g1, b1, r2, g2, b2 = to_rgb(y1.to_f, u.to_f, y2.to_f, v.to_f)

        return {r1.to_u8, g1.to_u8, b1.to_u8, r2.to_u8, g2.to_u8, b2.to_u8}
      end
    end
  end
end
