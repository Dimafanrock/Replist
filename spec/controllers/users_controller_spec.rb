# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  def valid_attributes
    { login: 'Test' }
  end

  context 'test user#show' do
    let!(:user) { User.create(login: 'Test') }
    it 'should be successful' do
      get :show, params: { id: user }
      expect(response).to be_successful
    end
  end

  context 'test user#new' do
    it 'show new user' do
      get :new, params: { login: 'Test' }
      expect(assigns(:user)).to be_a_new(User)
    end
  end

  context 'test user#create' do
    it 'creates new user' do
      expect do
        post :create, params: { user: { login: 'Test' } }
      end.to change(User, :count).by(1)
    end

    it 'created user as @user' do
      post :create, params: { user: { login: 'Test' } }
      expect(assigns(:user)).to be_a(User)
      expect(assigns(:user)).to be_persisted
    end

    it 'redirects to the created user' do
      post :create, params: { user: { login: 'Test' } }
      expect(response).to redirect_to(User.last)
    end
  end

  context 'invalid params' do
    it 'unsaved user as @order' do
      User.any_instance.stub(:save).and_return(true)
      post :create, params: { user: { login: nil } }
      expect(assigns(:user)).to be_a_new(User)
    end

    it "re-renders the 'new' template" do
      User.any_instance.stub(:save).and_return(false)
      post :create, params: { user: { login: nil } }
      expect(response).to render_template('new')
    end
  end
end
