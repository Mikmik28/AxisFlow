require 'rails_helper'

RSpec.describe "stock_items/index", type: :view do
  before(:each) do
    assign(:stock_items, [
      StockItem.create!(
        product: nil,
        warehouse: nil,
        on_hand: 2,
        reserved: 3
      ),
      StockItem.create!(
        product: nil,
        warehouse: nil,
        on_hand: 2,
        reserved: 3
      )
    ])
  end

  it "renders a list of stock_items" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(nil.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
    assert_select cell_selector, text: Regexp.new(3.to_s), count: 2
  end
end
