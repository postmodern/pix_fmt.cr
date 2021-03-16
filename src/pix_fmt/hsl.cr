require "./fields/h"
require "./fields/s"

module PixFmt
  struct HSL

    include Fields::H(UInt8)
    include Fields::S(UInt8)

    property l : UInt8

    def initialize(@h : UInt8 = 0, @s : UInt8 = 0, @l : UInt8 = 0)
    end

    @[AlwaysInline]
    def lightness
      @l
    end

    @[AlwaysInline]
    def lightness=(new_lightness : UInt8)
      @l = new_lightness
    end

  end
end
