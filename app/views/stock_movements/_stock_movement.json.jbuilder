json.extract! stock_movement, :id, :product_id, :warehouse_id, :qty_delta, :reason, :reference_id, :reference_type, :created_at, :updated_at
json.url stock_movement_url(stock_movement, format: :json)
