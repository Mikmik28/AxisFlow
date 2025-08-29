require "rails_helper"

RSpec.describe StockMovementsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/stock_movements").to route_to("stock_movements#index")
    end

    it "routes to #new" do
      expect(get: "/stock_movements/new").to route_to("stock_movements#new")
    end

    it "routes to #show" do
      expect(get: "/stock_movements/1").to route_to("stock_movements#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/stock_movements/1/edit").to route_to("stock_movements#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/stock_movements").to route_to("stock_movements#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/stock_movements/1").to route_to("stock_movements#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/stock_movements/1").to route_to("stock_movements#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/stock_movements/1").to route_to("stock_movements#destroy", id: "1")
    end
  end
end
