require 'rails_helper'

RSpec.describe '/posts', type: :request do
  describe 'PostsController' do
    context 'GET index' do
      before(:example) do
        get '/users/1/posts'
      end

      it 'Success response' do
        expect(response).to be_successful
      end

      it 'render template' do
        expect(response).to render_template(:index)
      end

      it 'render body placeholder text' do
        expect(response.body).to include('list of posts')
      end
    end

    context 'GET show action' do
      before(:example) do
        get '/users/1/posts/1'
      end

      it 'Success response show action' do
        expect(response).to have_http_status(:success)
      end

      it 'Render correct template show' do
        expect(response).to render_template(:show)
      end

      it 'render placeholder' do
        expect(response.body).to include('single of post')
      end
    end
  end
end
