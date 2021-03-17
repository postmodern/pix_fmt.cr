require "./fields/r"
require "./fields/g"
require "./fields/b"
require "./fields/a"

module PixFmt
  struct RGBA

    include Fields::R(UInt8)
    include Fields::G(UInt8)
    include Fields::B(UInt8)
    include Fields::A(UInt8)

    def initialize(@r : UInt8 = 0, @g : UInt8 = 0, @b : UInt8 = 0, @a : UInt8 = 255)
    end

    def self.gray(gray : UInt8, alpha : UInt8 = 255)
      new(r: gray, g: gray, b: gray, a: alpha)
    end

    def self.black(alpha : UInt8 = 255)
      gray(0, alpha: alpha)
    end

    def self.red(red : UInt8 = 255, alpha : UInt8 = 255)
      new(r: red, g: 0, b: 0, a: alpha)
    end

    def self.green(green : UInt8 = 255, alpha : UInt8 = 255)
      new(r: 0, g: green, b: 0, a: alpha)
    end

    def self.blue(blue : UInt8 = 255, alpha : UInt8 = 255)
      new(r: 0, g: 0, b: blue, a: alpha)
    end

    def to_rgb : RGB
      RGB.new(r: @r, g: @g, b: @b)
    end

    def to_rgb(ptr : RGB *)
      ptr.value.r = @r
      ptr.value.g = @g
      ptr.value.b = @b
    end

  end
end
