module PixFmt
  module Fields
    module V(T)
      property v : T

      @[AlwaysInline]
      def c_r : T
        @v
      end

      @[AlwaysInline]
      def c_r=(new_red : T)
        @v = new_red
      end

      @[AlwaysInline]
      def red : UInt8
        @v
      end

      @[AlwaysInline]
      def red=(new_red : UInt8)
        @v = new_red
      end
    end
  end
end
