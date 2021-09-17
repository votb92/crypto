class MandateHelpers
  def self.test
    require 'net/http'
    require 'json'
    @url = 'https://lis.virginia.gov/000/HouseBudgetFloorAmendments8-3-21-1.pdf'
    @uri = URI(@url)
    begin
      @response = Net::HTTP.get(@uri)
      puts @response[1..3].inspect
    rescue JSON::ParserError
      puts "rescue successfully"
    end
  end
end
