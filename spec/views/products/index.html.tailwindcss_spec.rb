require 'rails_helper'

RSpec.describe "products/index", type: :view do
  before(:each) do
    assign(:products, [
      Product.create!(
        sku: "Sku",
        name: "Name",
        unit: "Unit",
        barcode: "Barcode",
        price_cents: "",
        currency: "Currency"
      ),
      Product.create!(
        sku: "Sku",
        name: "Name",
        unit: "Unit",
        barcode: "Barcode",
        price_cents: "",
        currency: "Currency"
      )
    ])
  end

  it "renders a list of products" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Sku".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Unit".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Barcode".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Currency".to_s), count: 2
  end
end
