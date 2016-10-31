class ApplicationMailer < ActionMailer::Base
  default :from => "Rails Airways <no-reply@railsairways.com>"
  layout 'mailer'
end
