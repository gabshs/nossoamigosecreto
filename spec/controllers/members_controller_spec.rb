require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  include Devise::Test::ControllerHelpers

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
    @current_user = FactoryBot.create(:user)
    sign_in @current_user
  end

  describe "POST #create" do
    before(:each) do
      @campaign = create(:campaign, user: @current_user)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it 'Create member with right attributes' do
      member = create(:member, campaign: @campaign)
      expect(Member.last.name).to eql(member.name)
      expect(Member.last.email).to eql(member.email)
      expect(Member.last.campaign_id).to eql(@campaign.id)
    end
  end

  describe "PUT #update" do
    before(:each) do
      @campaign = create(:campaign, user: @current_user)
      @new_member_attributes = attributes_for(:member)
      request.env["HTTP_ACCEPT"] = 'application/json'
    end

    it 'Create member with right attributes' do
      member = create(:member, campaign: @campaign)
      put :update, params: {id: member.id, member: @new_member_attributes}
      expect(true).to eql(JSON(response.body))
    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @campaign = create(:campaign, user: @current_user)
      request.env['HTTP_ACCEPT'] = 'application/json'
    end

    it 'return json true' do
      member = create(:member, campaign: @campaign)
      delete :destroy, params: {id: member.id}
      expect(true).to eql(JSON(response.body))
    end

  end
  

end
