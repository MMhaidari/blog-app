require 'rails_helper'

RSpec.describe '/users', type: :request do
  describe 'UsersController' do
    context 'GET index' do
      before(:example) do
        create(:user, id: 1)
        get '/users'
      end

      it 'success for index action' do
        expect(response).to have_http_status(:success)
      end

      it 'Render correct template for index action' do
        expect(response).to render_template(:index)
      end

      it 'Render correct body placeholder' do
        expect(response.body).to include('<h1>list of Users</h1>')
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end

    describe 'GET /users/:id' do
      let(:user) { User.create(name: 'Lilly', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Poland.') }

      before do
        get "/users/#{user.id}"
      end

      it 'returns succesfull response' do
        expect(response).to be_successful
      end
    end
  end
end
