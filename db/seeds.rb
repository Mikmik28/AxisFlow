# AxisFlow demo seeds
org = Organization.find_or_create_by!(name: "Acme Trading", slug: "acme")
user = User.find_or_create_by!(organization: org, email: "admin@acme.test") do |u|
  # Replace with Devise-specific password setter once Devise installed
  u.encrypted_password = "password"
  u.first_name = "Admin"
  u.last_name = "User"
  u.role = "admin"
  u.time_zone = "Asia/Manila"
end

w1 = Warehouse.find_or_create_by!(organization: org, code: "MNL") { |w| w.name = "Main WH Manila" }

p1 = Product.find_or_create_by!(organization: org, sku: "SKU-001") do |p|
  p.name = "Sample Widget"
  p.unit = "pcs"
  p.price_cents = 100_00
  p.currency = "USD"
end

# Requires Inventory::AdjustStock service after you create it
puts "Seeded org=#{org.name} admin=#{user.email} product=#{p1.sku}"
