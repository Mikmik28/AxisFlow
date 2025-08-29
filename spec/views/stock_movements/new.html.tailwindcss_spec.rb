require 'rails_helper'

RSpec.describe "stock_movements/new", type: :view do
  before(:each) do
    assign(:stock_movement, StockMovement.new(
      product: nil,
      warehouse: nil,
      qty_delta: 1,
      reason: "MyString",
      reference: nil
    ))
  end

  it "renders new stock_movement form" do
    render

    assert_select "form[action=?][method=?]", stock_movements_path, "post" do

      assert_select "input[name=?]", "stock_movement[product_id]"

      assert_select "input[name=?]", "stock_movement[warehouse_id]"

      assert_select "input[name=?]", "stock_movement[qty_delta]"

      assert_select "input[name=?]", "stock_movement[reason]"

      assert_select "input[name=?]", "stock_movement[reference_id]"
    end
  end
end
