require 'rails_helper'

RSpec.describe "stock_movements/show", type: :view do
  before(:each) do
    assign(:stock_movement, StockMovement.create!(
      product: nil,
      warehouse: nil,
      qty_delta: 2,
      reason: "Reason",
      reference: nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/Reason/)
    expect(rendered).to match(//)
  end
end
