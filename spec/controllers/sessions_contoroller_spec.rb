RSpec.describe SessionsController, type: :controller do
  
    describe '#create' do
      let(:params) { { user_id: user.id} }
        context 'log in' do
          before do
            login user
          end
        end
      expect(response).to redirect_to top_path(user)
      expect(is_logged_in?).to be_truthy 
    end
  end

