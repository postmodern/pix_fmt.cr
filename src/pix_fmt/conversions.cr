module PixFmt
  module Conversions
    def self.hsv_to_rgb(h : Float32, s : Float32, v : Float32) : {Float32, Float32, Float32}
      if h > 360.0 || h < 0.0
        raise ArgumentError.new("h argument must be between 0.0 and 360.0: #{h.inspect}")
      end

      if s > 1.0 || s < 0.0
        raise ArgumentError.new("s argument must be between 0.0 and 1.0: #{s.inspect}")
      end

      if v > 1.0 || v < 0.0
        raise ArgumentError.new("v argument must be between 0.0 and 1.0: #{v.inspect}")
      end

      c = s * v
      h_prime = (h / 60.0)
      x = c * (1 - ((h_prime % 2) - 1).abs)
      m = v - c

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

      return ((r+m) * 255),
             ((g+m) * 255),
             ((b+m) * 255)
    end

    def self.hsl_to_rgb(h : Float32, s : Float32, l : Float32) : {Float32, Float32, Float32}
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

      return (r+m) * 255,
             (g+m) * 255,
             (b+m) * 255
    end
  end
end
