module PixFmt
  module Conversions
    module RGB
      def self.to_yuv(r : Float32, g : Float32, b : Float32) {Float32, Float32, Float32}
        y =  (0.257 * r) + (0.504 * g) + (0.098 * b) + 16
        v =  (0.439 * r) - (0.368 * g) - (0.071 * b) + 128
        u = -(0.148 * r) - (0.291 * g) + (0.439 * b) + 128

        return {y.clamp(0,255), u.clamp(0,255), v.clamp(0,255)}
      end

      def self.to_yuv(r : UInt8, g : UInt8, b : UInt8) : {UInt8, UInt8, UInt8}
        y, u, v = rgb_to_yuv(r.to_f, g.to_f, b.to_f)

        return {y.to_u8, u.to_u8, v.to_u8}
      end
    end
  end
end
