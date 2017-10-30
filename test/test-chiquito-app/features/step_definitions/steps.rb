require 'minitest/autorun'

When(/^I request (.+)$/) do |endpoint|
	puts "When #{endpoint}"
	response = HTTParty.get("http://localhost:8000/#{endpoint}")
	@http_response_code = response.code
	@http_response_header = response.headers["X-Chiquito"]
end

Then(/^I get the (.+) header containing (.+)$/) do |header,value|
	puts "Then #{header}=#{value} - #{@http_response_header}"
	assert_equal  value.to_i , @http_response_code
end
