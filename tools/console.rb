require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
# Startups:
microsoft=Startup.new("Microsoft", "Bill Gates", "technology")
wp_engine=Startup.new("WP Engine", "Jason Cohen", "technology")
atlassian= Startup.new("Atlassian", "Scott Farqhuar", "technology")
uber = Startup.new("Uber", "Poopy Head", "technology")
wp_engine.pivot("WP Engine 2", "Food Service")
mcdonalds = Startup.new("McDonalds", "Mac Danolds", "Food Service")

# Venture Capitalists
vc_1= VentureCapitalist.new("Mr. So and So", 1000000000)
vc_2= VentureCapitalist.new("Mr. Buttface", 1000000)
vc_3= VentureCapitalist.new("Mr. Buttface", 1000000000)

# Funding Round
funding_round1= FundingRound.new(microsoft, vc_1, "First Round", 1000000)
funding_round2= FundingRound.new(uber, vc_2, "Second Round", 10000001)
funding_round3= FundingRound.new(wp_engine, vc_3, "Second Round", 10000001)
funding_round4= FundingRound.new(microsoft, vc_1, "Second Round", 10000001)


#Sign contract
# microsoft.sign_contract(vc_3, "Series C", 200000)
vc_3.biggest_investment
binding.pry
0 #leave this here to ensure binding.pry isn't the last line