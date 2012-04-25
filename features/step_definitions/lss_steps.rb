require_relative '../../app/lss_parser'

Given /^the previous output from the ls command:$/ do |output_from_ls_command|
  @lss_parser = LssParser.new(output_from_ls_command)
end

When /^lss parses the output$/ do
  @output = @lss_parser.parse
end

Then /^the output should look like:$/ do |expected_output|
  @output.should == expected_output
end