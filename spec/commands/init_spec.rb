require "spec_helper"

describe Commands::Init do
  let(:app) { SimpleWarehouse.new }

  subject { Commands::Init.new(app) }

  it { should be_a Commands::Command }

  describe "#execute" do
    context "when a 2x1 store is provided" do
      let(:opts) { [2, 1] }

      it "should create a 2x1 store" do
        subject.execute(opts)
        expect(app.store.width).to eq 2
        expect(app.store.height).to eq 1
      end
    end

    context "when no width is provided" do
      let(:opts) { [] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No store width provided")
      end
    end

    context "when no height is provided" do
      let(:opts) { [1] }

      it "should raise an error" do
        expect do
          subject.execute(opts)
        end.to raise_error(Commands::Error, "No store height provided")
      end
    end
  end
end
