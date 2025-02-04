require "rails_helper"

RSpec.describe LanguagePolicy do
  subject { described_class }

  let(:admin) { build_stubbed(:casa_admin) }
  let(:supervisor) { build_stubbed(:supervisor) }
  let(:volunteer) { build_stubbed(:volunteer) }

  permissions :add_to_volunteer?, :remove_from_volunteer? do
    context "when user is a casa admin" do
      it "doesn't permit" do
        is_expected.not_to permit(admin)
      end
    end

    context "when user is a supervisor" do
      it "doesn't permit" do
        is_expected.not_to permit(supervisor)
      end
    end

    context "when user is a volunteer" do
      it "allows" do
        is_expected.to permit(volunteer)
      end
    end
  end
end
