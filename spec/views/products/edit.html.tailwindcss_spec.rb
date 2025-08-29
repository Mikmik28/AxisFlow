require 'rails_helper'

RSpec.describe "products/edit", type: :view do
  let(:product) {
    Product.create!(
      sku: "MyString",
      name: "MyString",
      unit: "MyString",
      barcode: "MyString",
      price_cents: "",
      currency: "MyString"
    )
  }

  before(:each) do
    assign(:product, product)
  end

  it "renders the edit product form" do
    render

    assert_select "form[action=?][method=?]", product_path(product), "post" do

      assert_select "input[name=?]", "product[sku]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[unit]"

      assert_select "input[name=?]", "product[barcode]"

      assert_select "input[name=?]", "product[price_cents]"

      assert_select "input[name=?]", "product[currency]"
    end
  end
end
