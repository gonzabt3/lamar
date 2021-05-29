require "rails_helper"

RSpec.describe "Posts", type: :request do
  describe "POST /posts" do
    let(:params) do
      {
        body: "body-post-test" 
      }
    end
    context "when the user is login" do
      let!(:user) { create(:user) }
      include_context "user login"
      context "when the params are valid" do
        it "creates the resource" do
          expect{ post posts_path, params: params }.to change(Post, :count)
        end
      end
    end
    context "when the user does not login" do
      it "does not create the resource" do
        expect{ post posts_path, params: params }.to_not change(Post, :count)
      end
      pending("redirect to login page")
    end
  end
end