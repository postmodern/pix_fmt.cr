require "./fields/h"
require "./fields/s"
require "./fields/a"

module PixFmt
  struct HSVA

    include Fields::H(UInt8)
    include Fields::S(UInt8)

    property v : UInt8

    include Fields::A(UInt8)

    def initialize(@h : UInt8 = 0, @s : UInt8 = 0, @v : UInt8 = 0, @a : UInt8 = 255)
    end

    @[AlwaysInline]
    def value : UInt8
      @v
    end

    @[AlwaysInline]
    def value=(new_value : UInt8)
      @v = new_value
    end

  end

  type HSV32 = HSVA
end
