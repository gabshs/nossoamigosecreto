require 'rails_helper'

RSpec.describe CampaignRaffleJob, type: :job do
  before(:each) do
    ActiveJob::Base.queue_adapter = :test
    @campaign = create(:campaign, status: :pending)
    create(:member, campaign: @campaign)
    create(:member, campaign: @campaign)
    create(:member, campaign: @campaign)
  end

  describe "#perform" do
    it "to have enqueued" do
      expect{CampaignRaffleJob.perform_later(@campaign)}.to have_enqueued_job
    end
  end
end
