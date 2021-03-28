require "../spec_helper"
require "../../src/pix_fmt/conversions/hsv"

Spectator.describe PixFmt::Conversions::HSV do
  describe ".to_rgb(Float32, Float32, Float32)" do
    let(black) { {0.0, 0.0, 0.0} }
    let(white) { {255.0, 255.0, 255.0} }
    let(red)   { {255.0, 0.0, 0.0} }
    let(green) { {0.0, 255.0, 0.0} }
    let(blue)  { {0.0, 0.0, 255.0} }

    context "when brightness is 0%" do
      it "must return 0.0, 0.0, 0.0" do
        expect(subject.to_rgb(0.0, 0.0, 0.0)).to     eq(black)
        expect(subject.to_rgb(100.0, 1.0, 0.0)).to   eq(black)
        expect(subject.to_rgb(100.0, 0.5, 0.0)).to eq(black)
      end
    end

    context "when brightness is 100% and saturation is 0%" do
      it "must return 255.0, 255.0, 255.0" do
        expect(subject.to_rgb(0.0, 0.0, 1.0)).to   eq(white)
        expect(subject.to_rgb(100.0, 0.0, 1.0)).to eq(white)
      end
    end

    context "when hue is 0 degrees, saturation is 100%, and value is 100%" do
      it "must return RGB red" do
        expect(subject.to_rgb(0.0, 1.0, 1.0)).to eq(red)
      end
    end

    context "when hue is 120 degrees, saturation is 100%, and value is 100%" do
      it "must return RGB green" do
        expect(subject.to_rgb(120.0, 1.0, 1.0)).to eq(green)
      end
    end

    context "when hue is 240 degrees, saturation 100%, and value is 100%" do
      it "must return RGB blue" do
        expect(subject.to_rgb(240.0, 1.0, 1.0)).to eq(blue)
      end
    end

    context "when given a random HSV value" do
      it "must return the RGB equivalant" do
        expect(subject.to_rgb(120.0, 0.5, 0.80)).to eq({102.0, 204.0, 102.0})
      end
    end

    context "when hue is 0 or 360 degrees" do
      it "must treat them equivalent" do
        expect(subject.to_rgb(0.0, 0.5, 0.5)).to eq(subject.to_rgb(360, 0.5, 0.5))
      end
    end
  end
end
