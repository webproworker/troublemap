class LeaderMailer < ActionMailer::Base
  default from: "eproblema@outlook.com"

  def complaint(trouble)
    # logger.debug "+++++++++++++++++++++++++++++++++++++++++++++++++ #{@trouble.inspect}"
    @trouble = trouble
    # @city = @trouble.city
    # @city = trouble.city
    # city_email = @trouble.city.email
    # @city = trouble.city
    # @url = 'http://example.com/login'
    mail(to: @trouble.city.email, subject: "O noua problema in orasul #{@trouble.city.name}")
  end
end
