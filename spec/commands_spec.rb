require "spec_helper"

describe Commands do

  describe "#find" do
    subject { Commands.find(command, double("app")) }

    context "given command `help`" do
      let(:command) { "help" }

      it { should be_a Commands::Help }
    end

    context "given command `exit`" do
      let(:command) { "exit" }

      it { should be_a Commands::Exit }
    end

    context "given command `init`" do
      let(:command) { "init" }

      it { should be_a Commands::Init }
    end

    context "given command `store`" do
      let(:command) { "store" }

      it { should be_a Commands::Store }
    end

    context "given command `locate`" do
      let(:command) { "locate" }

      it { should be_a Commands::Locate }
    end

    context "given command `remove`" do
      let(:command) { "remove" }

      it { should be_a Commands::Remove }
    end

    context "given command `view`" do
      let(:command) { "view" }

      it { should be_a Commands::View }
    end

    context "given any other command" do
      let(:command) { "any" }

      it { should be_a Commands::Command }
    end
  end
end
