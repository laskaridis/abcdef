require "spec_helper"

describe Location do

  context "given string coordinates" do
    let(:x) { "1" }
    let(:y) { "2" }

    describe "#initialize" do
      subject { Location.new(x, y) }

      it "should convert them to integers" do
        expect(subject.x).to be_an Integer
        expect(subject.y).to be_an Integer
      end
    end
  end
end
