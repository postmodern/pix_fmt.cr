require "./fields/red"
require "./fields/green"
require "./fields/blue"
require "./rgba"

module PixFmt
  struct RGB

    include Fields::Red(UInt8)
    include Fields::Green(UInt8)
    include Fields::Blue(UInt8)

    def initialize(@r : UInt8 = 0, @g : UInt8 = 0, @b : UInt8 = 0)
    end

    def self.gray(gray : UInt8)
      new(r: gray, g: gray, b: gray)
    end

    def self.black
      gray(0)
    end

    def self.red(red : UInt8 = 255)
      new(r: red, g: 0, b: 0)
    end

    def self.green(green : UInt8 = 255)
      new(r: 0, g: green, b: 0)
    end

    def self.blue(blue : UInt8 = 255)
      new(r: 0, g: 0, b: blue)
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
