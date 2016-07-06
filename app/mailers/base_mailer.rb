class BaseMailer < ApplicationMailer
  add_template_helper(EmailHelper)
end