module PixFmt
  module Fields
    module Hue(T)
      property h : T

      @[AlwaysInline]
      def hue : T
        @h
      end

      @[AlwaysInline]
      def hue=(new_hue : T)
        @h = new_hue
      end
    end
  end
end
