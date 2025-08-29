require 'rails_helper'

RSpec.describe "products/show", type: :view do
  before(:each) do
    assign(:product, Product.create!(
      sku: "Sku",
      name: "Name",
      unit: "Unit",
      barcode: "Barcode",
      price_cents: "",
      currency: "Currency"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Sku/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Unit/)
    expect(rendered).to match(/Barcode/)
    expect(rendered).to match(//)
    expect(rendered).to match(/Currency/)
  end
end
