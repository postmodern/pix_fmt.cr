require "./fields/u"
require "./fields/v"

module PixFmt
  struct YUYV

    property y1 : UInt8

    include Fields::U(UInt8)

    property y2 : UInt8

    include Fields::V(UInt8)

    def initialize(@y1 : UInt8 = 0, @u : UInt8 = 0, @y2 : UInt8 = 0, @v : UInt8 = 0)
    end

  end
end
