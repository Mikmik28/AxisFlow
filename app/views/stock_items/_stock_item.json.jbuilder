json.extract! stock_item, :id, :product_id, :warehouse_id, :on_hand, :reserved, :created_at, :updated_at
json.url stock_item_url(stock_item, format: :json)
