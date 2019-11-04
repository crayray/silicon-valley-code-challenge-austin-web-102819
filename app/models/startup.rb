# require_relative '../../tools/console.rb'
class Startup
    attr_accessor :name
    attr_reader :domain, :founder

    @@all = []
    def initialize(startup_name, founder, domain)
        @name= startup_name
        @founder = founder
        @domain = domain
        @@all << self
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founder_name)
        Startup.all.find {|startup| startup.founder == founder_name}
    end

    def self.domains
        Startup.all.map {|startup| startup.domain}.uniq
        
    end

    def sign_contract(venture_cap_object,type, amount_invested)
        # new_round=FundingRound.new(self,venture_cap_object,type, amount_invested)
        # self.funding_round = new_round
        # venture_cap_object.funding_round= new_round
        FundingRound.new(self, venture_cap_object, type, amount_invested)
    end

    def num_funding_rounds
        my_rounds=FundingRound.all.select {|f| f.startup == self}
        my_rounds.length
        
    end
    def investors
        # self -> instance of start up (aka Uber)
        # GOAL: return an array of all v_c objects that have funded this startup
  
        # Step 1: filter through <joiner>, go from all <joiners> to only those that apply to self
  
        # my_funding_rounds = []
        # FundingRound.all.each do |funding_round|
        #     if funding_round.startup == self
        #         my_funding_rounds << funding_round
        #     end
        # end
        my_funding_rounds = FundingRound.all.select do |funding_round|
                              funding_round.startup == self
                          end
            
  
        # Step 2: the <joiner> connects self with each of the VCs
        # from each of my <joiners>, get me the VC
        # my_vcs = []
        # my_funding_rounds.each do |funding_round|
        #     my_vcs << funding_round.venture_capitalist
        # end
  
        my_funding_rounds.map do |funding_round|
            funding_round.venture_capitalist
            # binding.pry
         end
    end

    def total_funds
        rounds=FundingRound.all.select {|round| round.startup == self}
        rounds.inject(0) {|total, round| total + round.investment}
        # Return all funding rounds where @startup=self
        # Take FundingRound.investment and add it up. 
    end

    def big_investors
        investors = self.investors
        investors.select{|i| i.total_worth >= 1000000000}.uniq
    end
end
