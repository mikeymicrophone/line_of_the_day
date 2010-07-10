namespace :mail do
  desc 'fetch and parse new emails'
  task :fetch => :environment do
    Mail.all.each do |m|
      newsletter = Newsletter.find_or_create_by_sender_address m.from.first
      Edition.create :body => m.body.to_s, :subject => m.subject, :newsletter => newsletter, :sent_on => m.received.first.date_time
    end
  end
end