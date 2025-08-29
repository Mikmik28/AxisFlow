require 'rails_helper'

RSpec.describe "stock_movements/index", type: :view do
  before(:each) do
    assign(:stock_movements, [
      StockMovement.create!(
        product: nil,
        warehouse: nil,
        qty_delta: 2,
        reason: "Reason",
        reference: nil
      ),
      StockMovement.create!(
        product: nil,
        warehouse: nil,
        qty_delta: 2,
        reason: "Reason",
        reference: nil
      )
    ])
  end

  it "renders a list of stock_movements" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Reason".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
  end
end
