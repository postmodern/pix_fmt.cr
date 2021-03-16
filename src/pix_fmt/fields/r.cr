module PixFmt
  module Fields
    module R(T)
      property r : T

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
