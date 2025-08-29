json.extract! product, :id, :sku, :name, :unit, :barcode, :price_cents, :currency, :created_at, :updated_at
json.url product_url(product, format: :json)
