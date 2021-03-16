module PixFmt
  module Fields
    module U(T)
      property u : T

      @[AlwaysInline]
      def c_b : T
        @u
      end

      @[AlwaysInline]
      def c_b(new_blue : T)
        @u = new_blue
      end

      @[AlwaysInline]
      def blue : T
        @u
      end

      @[AlwaysInline]
      def blue=(new_blue : T)
        @u = new_blue
      end
    end
  end
end
