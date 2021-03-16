require "./fields/u"
require "./fields/v"

module PixFmt
  struct YUV

    property y : UInt8

    include Fields::U(UInt8)
    include Fields::V(UInt8)

    def initialize(@y : UInt8 = 0, @u : UInt8 = 0, @v : UInt8 = 0)
    end

    @[AlwaysInline]
    def luma : UInt8
      @y
    end

  end
end
