module PixFmt
  module Fields
    module G(T)
      property g : T

      macro included
        def self.green(green : UInt8 = 255)
          new(g: green)
        end
      end

      @[AlwaysInline]
      def green : T
        @g
      end

      @[AlwaysInline]
      def green=(new_green : T)
        @g = new_green
      end
    end
  end
end
