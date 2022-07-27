require 'sendgrid-ruby'
include SendGrid

from = Email.new(email: 'razakadegoke@outlook.fr')
to = Email.new(email: 'razakadegoke09@gmail.com')
subject = 'Sending with SendGrid is Fun'
content = Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
mail = Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: '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')
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.headers
