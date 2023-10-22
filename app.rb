require "sinatra"
require "sinatra/reloader"

get("/") do
  erb(:square_new)
end

get("/square/new") do
  erb(:square_new)
end
get("/square/results") do
  @num_to_square = params.fetch("num_to_square")
  @square_num = @num_to_square.to_f ** 2
  erb(:square_results)
end

get("/square_root/new")do
  erb(:square_root_new)
end
get("/square_root/results")do
  @num_to_square_root = params.fetch("num_to_square_root")
  @square_root = @num_to_square_root.to_f ** (0.5)
  erb(:square_root_results)
end

get("/payment/new")do
  erb(:payment_new)
end
get("/payment/results")do
  @APR = params.fetch("APR").to_f
  @num_years = params.fetch("num_years")
  @principal = params.fetch("principal").to_f

  periods = @num_years.to_f * 12.0
  rate = (@APR / 100.0) / 12.0

  numerator = rate * @principal
  denominator = 1.0 - ((1.0 + rate) ** (-1.0 * periods))

  @payment = numerator/denominator

  erb(:payment_results)
end

get("/random/new")do
  erb(:random_new)
end
get("/random/results")do
  @min_num = params.fetch("min_num")
  @max_num = params.fetch("max_num")

  @random_num = rand(@min_num.to_f..@max_num.to_f)
  erb(:random_results)
end
