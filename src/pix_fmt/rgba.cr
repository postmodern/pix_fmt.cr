require "./fields/red"
require "./fields/green"
require "./fields/blue"

module PixFmt
  struct RGBA

    include Fields::Red(UInt8)
    include Fields::Green(UInt8)
    include Fields::Blue(UInt8)

    property a : UInt8

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

    @[AlwaysInline]
    def alpha : UInt8
      @a
    end

    @[AlwaysInline]
    def alpha=(new_alpha : UInt8)
      @a = new_alpha
    end

    @[AlwaysInline]
    def transparent?
      @a < 255
    end

    @[AlwaysInline]
    def opaque?
      @a == 255
    end

  end
end
