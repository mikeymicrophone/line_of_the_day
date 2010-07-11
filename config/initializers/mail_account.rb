Mail.defaults do
  retriever_method :pop3, { :address             => "pop.gmail.com",
                            :port                => 995,
                            :user_name           => 'reader@lineoftheday.com',
                            :password            => 'manyletters',
                            :enable_ssl          => true }
  delivery_method :smtp,  { :address              => "smtp.gmail.com",
                            :port                 => 587,
                            :domain               => 'lineoftheday.com',
                            :user_name            => 'host@lineoftheday.com',
                            :password             => 'manypeople',
                            :authentication       => 'plain',
                            :enable_starttls_auto => true }
end