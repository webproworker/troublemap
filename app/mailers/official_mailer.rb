class OfficialMailer < ActionMailer::Base
  default from: "alex@nagemus.com"

  def problem_email(trouble, official)
    @trouble = trouble
    # @official = official
    @url = 'google.com'
    mail(to: official, subject: 'A fost raportata o problema')
  end
end
