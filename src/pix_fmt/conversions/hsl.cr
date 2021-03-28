module PixFmt
  module Conversions
    module HSL
      def self.to_rgb(h : Float32, s : Float32, l : Float32) : {Float32, Float32, Float32}
        if h > 360.0 || h < 0.0
          raise ArgumentError.new("h argument must be between 0.0 and 360.0: #{h.inspect}")
        end

        if s > 1.0 || s < 0.0
          raise ArgumentError.new("s argument must be between 0.0 and 1.0: #{s.inspect}")
        end

        if l > 1.0 || l < 0.0
          raise ArgumentError.new("l argument must be between 0.0 and 1.0: #{l.inspect}")
        end

        c = (1 - ((2 * l) - 1).abs) * s
        x = c * (1 - (((h / 60.0) % 2) - 1).abs)
        m = l - (c / 2)

        if h >= 0 && h < 60
          r, g, b = c, x, 0
        elsif h >= 60 && h < 120
          r, g, b = x, c, 0
        elsif h >= 120 && h < 180
          r, g, b = 0, c, x
        elsif h >= 180 && h < 240
          r, g, b = 0, x, c
        elsif h >= 240 && h < 300
          r, g, b = x, 0, c
        else
          r, g, b = c, 0, x
        end

        return {(r+m)*255, (g+m)*255, (b+m)*255}
      end

      def self.to_rgb(h : UInt8, s : UInt8, l : UInt8) : {UInt8, UInt8, UInt8}
        r, g, b = to_rgb(((h / 255) * 360.0).to_f32, (s / 255).to_f32, (l / 255).to_f32)

        {r.to_u8, g.to_u8, b.to_u8}
      end
    end
  end
end
