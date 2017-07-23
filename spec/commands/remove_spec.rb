require "spec_helper"

describe Commands::Remove do
  let(:app) { SimpleWarehouse.new }
  subject { Commands::Remove.new(app) }

  it { should be_a Commands::Command }

  describe "#execute" do

    context "when no x location specified" do
      let(:opts) { [ ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No x location specified")
      end
    end

    context "when no y location specified" do
      let(:opts) { [ 1 ] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No y location specified")
      end
    end

    context "when no store is initialized" do
      let(:opts) { [ 1, 2 ] }

      before { app.store = nil }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No store initialized")
      end
    end

    context "when (1,2) location is specified and store initialized" do
      let(:opts) { [ 1, 2 ] }

      before { app.store = Store.new(2,2) }

      it "should invoke `remove` on store for product" do
        expect(app.store).to receive(:remove) do |location|
          expect(location.x).to eq 1
          expect(location.y).to eq 2
        end

        subject.execute(opts)
      end
    end
  end
end
