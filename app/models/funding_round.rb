# require_relative '../../tools/console.rb'
class FundingRound
    attr_accessor :type, :investment
    attr_reader :startup, :venture_capitalist

    @@all_funding_rounds = []
    def initialize(startup, venture_capitalist,type, investment)
        @startup= startup
        @venture_capitalist= venture_capitalist
        @type= type
        @investment= investment

        @@all_funding_rounds << self
    end

    def self.all
        @@all_funding_rounds
    end

end
