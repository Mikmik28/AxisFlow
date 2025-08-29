require 'rails_helper'

RSpec.describe "stock_movements/edit", type: :view do
  let(:stock_movement) {
    StockMovement.create!(
      product: nil,
      warehouse: nil,
      qty_delta: 1,
      reason: "MyString",
      reference: nil
    )
  }

  before(:each) do
    assign(:stock_movement, stock_movement)
  end

  it "renders the edit stock_movement form" do
    render

    assert_select "form[action=?][method=?]", stock_movement_path(stock_movement), "post" do

      assert_select "input[name=?]", "stock_movement[product_id]"

      assert_select "input[name=?]", "stock_movement[warehouse_id]"

      assert_select "input[name=?]", "stock_movement[qty_delta]"

      assert_select "input[name=?]", "stock_movement[reason]"

      assert_select "input[name=?]", "stock_movement[reference_id]"
    end
  end
end
