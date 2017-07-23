require "spec_helper"

describe Crate do

  context "given string width dimensions" do
    let(:width) { "1" }
    let(:height) { "2" }
    
    describe "#initialize" do
      subject { Crate.new("x", width, height) }

      it "should convert them to integers" do
        expect(subject.width).to be_an Integer
        expect(subject.height).to be_an Integer
      end
    end
  end

  context "given a 2x2 crate" do
    subject { Crate.new("x", 2, 2) }

    context "and location (1,2)" do
      let(:location) { Location.new(1,2) }

      describe "#slot_at" do

        it "should return slot starting at (1,2) and ending at (3,4)" do
          slot = subject.slot_at(location)
          expect(slot.start.x).to eq 1
          expect(slot.start.y).to eq 2
          expect(slot.ends.x).to eq 2
          expect(slot.ends.y).to eq 3
        end
      end
    end
  end
end
