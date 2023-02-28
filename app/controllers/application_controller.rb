class ApplicationController < Sinatra::Base
set :default_content_type, "application/json"
  # add routes
  get "/bakeries" do 
    bekaries = Bakery.all
    bekaries.to_json
  end

  get "/bakeries/:id" do
    by_id = Bakery.find(params[:id])
    by_id.to_json(include: :baked_goods)
  end
  
  get "/baked_goods/by_price" do 
  by_price = BakedGood.all.order(price: :desc)
  by_price.to_json
  end

  get "/baked_goods/most_expensive" do
    most_expensive = BakedGood.all.order(price: :desc).first
    most_expensive.to_json
   end
end
