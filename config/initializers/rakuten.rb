RakutenWebService.configure do |c|
  c.application_id = ENV['RAKUTEN_API_KEY']
  c.affiliate_id = ENV['RAKUTEN_AFFILIATE']
end