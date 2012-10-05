require 'rubygems'
require 'nokogiri'

And /^I load the application$/ do 
  parse = Nokogiri::HTML("http://#{@app.name}-#{@account.domain}.dev.rhcloud.com")
  @app.instance_variable_set(:@html_parse, parse)
  @app.instance_eval('def html_parse; @html_parse; end')
end

And /^the quickstart will report readiness$/ do
  assert_equal 0, @app.html_parse.css(".notice:not(.success)").size
end
