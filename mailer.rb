require 'pony'

Pony.mail(:to => 'gonzalo.sanchez.d@gmail.com', :from => 'gonzalo', :subject => 'hi', :body => 'Hello there.')


# Pony.mail({
#   :to => 'destino@email.com',
#   :via => :smtp,
#   :via_options => {
#     :address              => 'smtp.gmail.com',
#     :port                 => '587',
#     :enable_starttls_auto => true,
#     :user_name            => 'tuuser@gmail.com',
#     :password             => 'tupass',
#     :authentication       => :plain, # :plain, :login, :cram_md5, no auth by default
#     :domain               => "localhost.localdomain" # the HELO domain provided by the client to the server
#   }
# })