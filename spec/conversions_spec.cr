require "./spec_helper"
require "../src/pix_fmt/conversions"

Spectator.describe PixFmt::Conversions do
  describe ".hsv_to_rgb" do
    context "when brightness is 0" do
      let(black) { {0.0, 0.0, 0.0} }

      it "must return 0.0, 0.0, 0.0" do
        expect(subject.hsv_to_rgb(0, 0, 0)).to     eq(black)
        expect(subject.hsv_to_rgb(100, 1, 0)).to   eq(black)
        expect(subject.hsv_to_rgb(100, 0.5, 0)).to eq(black)
      end
    end

    context "when brightness is 1 and saturation is 0" do
      let(white) { {255.0, 255.0, 255.0} }

      it "must return 255.0, 255.0, 255.0" do
        expect(subject.hsv_to_rgb(0, 0, 1)).to   eq(white)
        expect(subject.hsv_to_rgb(100, 0, 1)).to eq(white)
      end
    end

    context "when hue is 0, saturation is 1, and value is 1" do
      let(red) { {255.0, 0.0, 0.0} }

      it "must return RGB red" do
        expect(subject.hsv_to_rgb(0, 1, 1)).to eq(red)
      end
    end

    context "when hue is 120, saturation is 1, and value is 1" do
      let(green) { {0.0, 255.0, 0.0} }

      it "must return RGB green" do
        expect(subject.hsv_to_rgb(120, 1, 1)).to eq(green)
      end
    end

    context "when hue is 240, saturation 1, and value is 1" do
      let(blue)  { {0.0, 0.0, 255.0} }

      it "must return RGB blue" do
        expect(subject.hsv_to_rgb(240, 1, 1)).to eq(blue)
      end
    end

    context "when given a random HSV value" do
      it "must return the RGB equivalant" do
        expect(subject.hsv_to_rgb(120, 0.5, 0.80)).to eq({102.0, 204.0, 102.0})
      end
    end

    context "when hue is 0 or 360" do
      it "must treat them equivalent" do
        expect(subject.hsv_to_rgb(0, 0.5, 0.5)).to eq(subject.hsv_to_rgb(360, 0.5, 0.5))
      end
    end
  end
end
