class CampaignMailer < ApplicationMailer

  def raffle(campaign, member, friend)
   @campaign = campaign
   @member = member
   @friend = friend

    mail to: @member.email, subject: "Nosso amigo secreto: #{@campaign.title}"
  end

  def error(campaign)
    @campaign = campaign
    @owner = campaign.user

    mail to: @@owner.email, subject: "Erro na execução da campanha Nosso amigo secreto: #{@campaign.title}"
end
