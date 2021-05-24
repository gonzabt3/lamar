require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'POST /posts' do
    let!(:user) { create(:user) }
    include_context 'user login'
    describe 'when the user is login' do
      let(:params) do
        {
          body: "body-post-test" 
        }
      end
      it 'create the resource' do
        expect{post posts_path, params: params}.to change(Post, :count)
      end
    end
    describe 'when the user does not login' do
      
    end
  end
end