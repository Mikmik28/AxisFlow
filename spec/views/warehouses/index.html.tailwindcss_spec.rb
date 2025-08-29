require 'rails_helper'

RSpec.describe "warehouses/index", type: :view do
  before(:each) do
    assign(:warehouses, [
      Warehouse.create!(
        code: "Code",
        name: "Name",
        address: "MyText"
      ),
      Warehouse.create!(
        code: "Code",
        name: "Name",
        address: "MyText"
      )
    ])
  end

  it "renders a list of warehouses" do
    render
    cell_selector = 'div>p'
    assert_select cell_selector, text: Regexp.new("Code".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Name".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("MyText".to_s), count: 2
  end
end
