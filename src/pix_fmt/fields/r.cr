module PixFmt
  module Fields
    module R(T)
      property r : T

      macro included
        def self.red(red : UInt8 = 255)
          new(r: red)
        end
      end

      @[AlwaysInline]
      def red : T
        @r
      end

      @[AlwaysInline]
      def red=(new_red : T)
        @r = new_red
      end

    end
  end
end
