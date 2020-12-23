module CampaignsHelper

    def open_number(campaign)
        "#{campaign.count_opened}/#{campaign.member.count}"
    end
end
