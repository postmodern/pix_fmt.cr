module PixFmt
  module Fields
    module B(T)
      property b : T

      macro included
        def self.blue(blue : UInt8 = 255)
          new(b: blue)
        end
      end

      @[AlwaysInline]
      def blue : T
        @b
      end

      @[AlwaysInline]
      def blue=(new_blue : T)
        @b = new_blue
      end
    end
  end
end
