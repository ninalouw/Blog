class NewsletterMailer < ApplicationMailer
    default from: 'answersawesome@gmail.com'
    def weekly(email)
        mail to: email, subject: "RailsCasts Weekly"
    end
end

