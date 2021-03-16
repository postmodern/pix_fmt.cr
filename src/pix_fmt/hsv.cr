require "./fields/h"
require "./fields/s"

module PixFmt
  struct HSV

    include Fields::H(UInt8)
    include Fields::S(UInt8)

    property v : UInt8

    def initialize(@h : UInt8 = 0, @s : UInt8 = 0, @v : UInt8 = 0)
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
end
