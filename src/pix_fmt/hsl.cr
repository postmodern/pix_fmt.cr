require "./has_hue"
require "./has_saturation"

module PixFmt
  struct HSL

    include HasHue(UInt8)
    include HasSaturation(UInt8)

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
