require 'rails_helper'

RSpec.describe "stock_items/edit", type: :view do
  let(:stock_item) {
    StockItem.create!(
      product: nil,
      warehouse: nil,
      on_hand: 1,
      reserved: 1
    )
  }

  before(:each) do
    assign(:stock_item, stock_item)
  end

  it "renders the edit stock_item form" do
    render

    assert_select "form[action=?][method=?]", stock_item_path(stock_item), "post" do

      assert_select "input[name=?]", "stock_item[product_id]"

      assert_select "input[name=?]", "stock_item[warehouse_id]"

      assert_select "input[name=?]", "stock_item[on_hand]"

      assert_select "input[name=?]", "stock_item[reserved]"
    end
  end
end
