require 'rails_helper'

RSpec.describe "products/new", type: :view do
  before(:each) do
    assign(:product, Product.new(
      sku: "MyString",
      name: "MyString",
      unit: "MyString",
      barcode: "MyString",
      price_cents: "",
      currency: "MyString"
    ))
  end

  it "renders new product form" do
    render

    assert_select "form[action=?][method=?]", products_path, "post" do

      assert_select "input[name=?]", "product[sku]"

      assert_select "input[name=?]", "product[name]"

      assert_select "input[name=?]", "product[unit]"

      assert_select "input[name=?]", "product[barcode]"

      assert_select "input[name=?]", "product[price_cents]"

      assert_select "input[name=?]", "product[currency]"
    end
  end
end
