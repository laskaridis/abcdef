require "spec_helper"

describe Commands::View do
  let(:app) { SimpleWarehouse.new }
  subject { Commands::View.new(app) }

  it { should be_a Commands::Command }

  describe "#execute" do

    context "when no store is initialized" do
      before { app.store = nil }

      it "should raise an error" do
        expect do
          subject.execute
        end.to raise_error(Commands::Error, "No store initialized")
      end
    end

    context"when store is initialized" do
      before { app.store = Store.new(2,2) }

      it "should invoke `render` on a store printer instance" do
        expect_any_instance_of(StorePrinter).to receive(:render) do |printer|
          expect(printer).to be_a StorePrinter
          expect(printer.store).to eq app.store
        end
        
        subject.execute
      end
    end
  end
end
