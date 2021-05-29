require "rails_helper"

RSpec.describe "main/index", type: :view do
  describe "index" do
    let!(:user) { create(:user) }
    context "when the user is log in" do
      include_context "user login"
      it "hides the Sign up button" do
        expect(rendered).to_not match(/Sign up/)
        render
      end
      it "hides the log in button" do
        expect(rendered).to_not match(/Log in/)
        render
      end
    end
    context "when the user is not log in" do
      it "shows the log in button" do
        render
        expect(rendered).to match(/Log in/)
      end
      it "shows the Sign up button" do
        render
        expect(rendered).to match(/Sign up/)
      end
    end
  end
end