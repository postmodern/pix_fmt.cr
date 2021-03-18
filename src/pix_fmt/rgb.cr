require "./fields/r"
require "./fields/g"
require "./fields/b"
require "./rgba"

module PixFmt
  struct RGB

    include Fields::R(UInt8)
    include Fields::G(UInt8)
    include Fields::B(UInt8)

    def initialize(@r : UInt8 = 0, @g : UInt8 = 0, @b : UInt8 = 0)
    end

    def self.gray(gray : UInt8)
      new(r: gray, g: gray, b: gray)
    end

    def self.black
      gray(0)
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
