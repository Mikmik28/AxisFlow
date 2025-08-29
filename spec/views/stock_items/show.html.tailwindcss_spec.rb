require 'rails_helper'

RSpec.describe "stock_items/show", type: :view do
  before(:each) do
    assign(:stock_item, StockItem.create!(
      product: nil,
      warehouse: nil,
      on_hand: 2,
      reserved: 3
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
  end
end
