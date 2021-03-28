module PixFmt
  module Conversions
    module YUV
      def self.to_rgb(y : Float32, u : Float32, v : Float32) {Float32, Float32, Float32}
        b = 1.164 * (y - 16)                     + 2.018 * (u - 128)
        g = 1.164 * (y - 16) - 0.813 * (v - 128) - 0.391 * (u - 128)
        r = 1.164 * (y - 16) + 1.596 * (v - 128)

        return {r.clamp(0,255), g.clamp(0,255), b.clamp(0,255)}
      end

      def self.to_rgb(y : UInt8, u : UInt8, v : UInt8) {UInt8, UInt8, UInt8}
        r, g, b = yuv_to_rgb(y.to_f, u.to_f, v.to_f)

        return {r.to_u8, g.to_u8, b.to_u8}
      end
    end
  end
end
