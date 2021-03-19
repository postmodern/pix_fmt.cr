require "./fields/b"
require "./fields/g"
require "./fields/r"
require "./grayscale"
require "./rgb"
require "./rgba"

module PixFmt
  struct BGR

    include Fields::B(UInt8)
    include Fields::G(UInt8)
    include Fields::R(UInt8)
    include Grayscale(UInt8)

    def initialize(@b : UInt8 = 0, @g : UInt8 = 0, @r : UInt8 = 0)
    end

    def self.gray(gray : UInt8)
      new(b: gray, g: gray, r: gray)
    end

    def to_rgb : RGB
      RGB.new(r: @r, g: @g, b: @b)
    end

    def to_rgb(ptr : RGB *)
      ptr.value.r = @r
      ptr.value.g = @g
      ptr.value.b = @b
    end

    def to_rgba : RGBA
      RGBA.new(r: @r, g: @g, b: @b)
    end

    def to_rgba(ptr : RGBA *)
      ptr.value.r = @r
      ptr.value.g = @g
      ptr.value.b = @b
      ptr.value.a = 255
    end

  end
end
