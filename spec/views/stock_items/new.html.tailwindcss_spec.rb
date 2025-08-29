require 'rails_helper'

RSpec.describe "stock_items/new", type: :view do
  before(:each) do
    assign(:stock_item, StockItem.new(
      product: nil,
      warehouse: nil,
      on_hand: 1,
      reserved: 1
    ))
  end

  it "renders new stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_items_path, "post" do

      assert_select "input[name=?]", "stock_item[product_id]"

      assert_select "input[name=?]", "stock_item[warehouse_id]"

      assert_select "input[name=?]", "stock_item[on_hand]"

      assert_select "input[name=?]", "stock_item[reserved]"
    end
  end
end
