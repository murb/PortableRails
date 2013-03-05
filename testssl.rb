#!/usr/bin/env ruby
require 'net/https'
https = Net::HTTP.new('encrypted.google.com', 443)
https.use_ssl = true
https.verify_mode = OpenSSL::SSL::VERIFY_PEER
https.request_get('/')
puts 'success!'