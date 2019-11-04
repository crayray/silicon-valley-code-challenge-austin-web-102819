class VentureCapitalist
    attr_accessor :name, :total_worth, :all_funding_rounds

    @@all_vcs = []
    def initialize(name, total_worth)
        @name= name
        @total_worth = total_worth
        @@all_vcs << self
    end

    def self.all
        @@all_vcs
    end
    
    def self.tres_commas_club
        VentureCapitalist.all.select {|vc| vc.total_worth >= 1000000000}
    end

    def offer_contract(startup_object,type, amount_invested)
        # new_round=FundingRound.new(self,venture_cap_object,type, amount_invested)
        # self.funding_round = new_round
        # venture_cap_object.funding_round= new_round
        FundingRound.new(startup_object, self, type, amount_invested)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
        # binding.pry
    end

    def portfolio
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end
        my_startups=my_funding_rounds.map {|funding_round| funding_round.startup}.uniq
    end

    def biggest_investment
        my_funding_rounds = FundingRound.all.select do |funding_round|
            funding_round.venture_capitalist == self
        end 

        my_funding_rounds.max {|f1, f2| f1.investment <=> f2.investment}
        # my_funding_rounds.each do |fun|
        #     if fun.investment > total
        #         total = fun.investment
        #     end
        # binding.pry

        # investees= self.portfolio
        # investees.select {|i| }
        # investees.select{|i| i.total_worth >= 1000000000}.uniq

    end

    def invested(domain)
        full_funding_round = FundingRound.all.select {|round| round.startup.domain == domain}
        full_funding_round.reduce(0) {|sum, num| sum += num.investment}
    end
end


# if >= 1000000