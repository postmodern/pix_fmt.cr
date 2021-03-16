module PixFmt
  struct YUYV

    property y1 : UInt8

    property u : UInt8

    property y2 : UInt8

    property v : UInt8

    def initialize(@y1 : UInt8 = 0, @u : UInt8 = 0, @y2 : UInt8 = 0, @v : UInt8 = 0)
    end

  end
end
