require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  let(:my_user) { User.create!(email: "user@flicki.wiki", password: "password") }
  let(:my_wiki) { Wiki.create!(title: "Wiki Title", description: "Here's a wiki description.", director: "Steven Spielberg", year: 2017, private: false, user_id: 1) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
    
    it "assigns [my_wiki] to @wikis" do
      get :index
      expect(assigns(:wikis)).to eq([my_wiki])
    end
  end

  # describe "GET #show" do
  #   it "returns http success" do
  #     get :show
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "GET #new" do
    before :each do 
      sign_in my_user
    end
    
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
    
    it "renders the #new view" do
      get :new
      expect(response).to render_template(:new)
    end
    
    it "instantiates @wiki" do
      get :new
      expect(assigns(:wiki)).not_to be_nil
    end
  end
  
  describe "POST create" do
    before :each do 
      sign_in my_user
    end
    
    it "increases the number of Wiki by 1" do
      expect{ post :create, params: { wiki: { title: RandomData.random_movie_title, director: RandomData.random_name, year: RandomData.random_year, private: [true, false].sample, user_id: RandomData.random_user_id } } }.to change(Wiki, :count).by(1)
    end
    
    it "assigns the new wiki to @wiki" do
      post :create, params: { wiki: { title: RandomData.random_movie_title, director: RandomData.random_name, year: RandomData.random_year, private: [true, false].sample, user_id: RandomData.random_user_id } }
      expect(assigns(:wiki)).to eq(Wiki.last)
    end
    
    it "redirects to the new wiki" do
      post :create, params: { wiki: { title: RandomData.random_movie_title, director: RandomData.random_name, year: RandomData.random_year, private: [true, false].sample, user_id: RandomData.random_user_id } }
      expect(response).to redirect_to(Wiki.last)
    end
  end

  # describe "GET #edit" do
  #   it "returns http success" do
  #     get :edit
  #     expect(response).to have_http_status(:success)
  #   end
  # end

end
