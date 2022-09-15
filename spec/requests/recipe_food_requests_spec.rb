require 'rails_helper' # rubocop:todo Layout/EndOfLine

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipe_food/index'
      expect(response).to have_http_status(:success)
    end
  end
end
