# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_08_28_182202) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "btree_gin"
  enable_extension "pg_catalog.plpgsql"
  enable_extension "pg_trgm"

  create_table "audit_events", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.string "action"
    t.string "auditable_type", null: false
    t.bigint "auditable_id", null: false
    t.jsonb "data", default: {}
    t.string "ip"
    t.string "user_agent"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["auditable_type", "auditable_id"], name: "index_audit_events_on_auditable"
    t.index ["organization_id"], name: "index_audit_events_on_organization_id"
    t.index ["user_id"], name: "index_audit_events_on_user_id"
  end

  create_table "bill_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "bill_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.bigint "unit_cost_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_bill_lines_on_bill_id"
    t.index ["organization_id"], name: "index_bill_lines_on_organization_id"
    t.index ["product_id"], name: "index_bill_lines_on_product_id"
  end

  create_table "bills", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "vendor_id", null: false
    t.string "bill_no"
    t.integer "status", default: 0
    t.datetime "issued_at"
    t.datetime "due_at"
    t.string "currency", limit: 3, default: "USD"
    t.bigint "total_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_no"], name: "index_bills_on_bill_no"
    t.index ["organization_id", "bill_no"], name: "index_bills_on_organization_id_and_bill_no", unique: true
    t.index ["organization_id"], name: "index_bills_on_organization_id"
    t.index ["vendor_id"], name: "index_bills_on_vendor_id"
  end

  create_table "customers", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "name"], name: "index_customers_on_organization_id_and_name"
    t.index ["organization_id"], name: "index_customers_on_organization_id"
  end

  create_table "financial_periods", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "period"
    t.date "starts_on"
    t.date "ends_on"
    t.boolean "closed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_financial_periods_on_organization_id"
    t.index ["period"], name: "index_financial_periods_on_period"
  end

  create_table "invoice_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "invoice_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.bigint "unit_price_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_invoice_lines_on_invoice_id"
    t.index ["organization_id"], name: "index_invoice_lines_on_organization_id"
    t.index ["product_id"], name: "index_invoice_lines_on_product_id"
  end

  create_table "invoices", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "sales_order_id", null: false
    t.string "invoice_no"
    t.integer "status", default: 0
    t.datetime "issued_at"
    t.datetime "due_at"
    t.string "currency", limit: 3, default: "USD"
    t.bigint "total_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_no"], name: "index_invoices_on_invoice_no"
    t.index ["organization_id", "invoice_no"], name: "index_invoices_on_organization_id_and_invoice_no", unique: true
    t.index ["organization_id"], name: "index_invoices_on_organization_id"
    t.index ["sales_order_id"], name: "index_invoices_on_sales_order_id"
  end

  create_table "journal_entries", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.date "posted_on"
    t.string "reference"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_journal_entries_on_organization_id"
    t.index ["reference"], name: "index_journal_entries_on_reference"
  end

  create_table "ledger_accounts", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "code"
    t.string "name"
    t.integer "kind"
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_ledger_accounts_on_code"
    t.index ["organization_id", "code"], name: "index_ledger_accounts_on_organization_id_and_code", unique: true
    t.index ["organization_id"], name: "index_ledger_accounts_on_organization_id"
  end

  create_table "organizations", force: :cascade do |t|
    t.string "name"
    t.string "slug"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["slug"], name: "index_organizations_on_slug"
  end

  create_table "payments", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "invoice_id", null: false
    t.bigint "amount_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.string "method"
    t.datetime "received_at"
    t.string "reference_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["invoice_id"], name: "index_payments_on_invoice_id"
    t.index ["organization_id"], name: "index_payments_on_organization_id"
  end

  create_table "permissions", force: :cascade do |t|
    t.string "key"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["key"], name: "index_permissions_on_key"
  end

  create_table "products", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "sku"
    t.string "name"
    t.string "unit"
    t.string "barcode"
    t.text "description"
    t.bigint "price_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "sku"], name: "index_products_on_organization_id_and_sku", unique: true
    t.index ["organization_id"], name: "index_products_on_organization_id"
    t.index ["sku"], name: "index_products_on_sku"
  end

  create_table "purchase_order_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "purchase_order_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.bigint "unit_cost_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_purchase_order_lines_on_organization_id"
    t.index ["product_id"], name: "index_purchase_order_lines_on_product_id"
    t.index ["purchase_order_id"], name: "index_purchase_order_lines_on_purchase_order_id"
  end

  create_table "purchase_orders", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "vendor_id", null: false
    t.string "po_no"
    t.integer "status", default: 0
    t.datetime "ordered_at"
    t.string "currency", limit: 3, default: "USD"
    t.bigint "total_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "po_no"], name: "index_purchase_orders_on_organization_id_and_po_no", unique: true
    t.index ["organization_id"], name: "index_purchase_orders_on_organization_id"
    t.index ["po_no"], name: "index_purchase_orders_on_po_no"
    t.index ["vendor_id"], name: "index_purchase_orders_on_vendor_id"
  end

  create_table "receipt_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "receipt_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_receipt_lines_on_organization_id"
    t.index ["product_id"], name: "index_receipt_lines_on_product_id"
    t.index ["receipt_id"], name: "index_receipt_lines_on_receipt_id"
  end

  create_table "receipts", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "purchase_order_id", null: false
    t.string "receipt_no"
    t.datetime "received_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "receipt_no"], name: "index_receipts_on_organization_id_and_receipt_no", unique: true
    t.index ["organization_id"], name: "index_receipts_on_organization_id"
    t.index ["purchase_order_id"], name: "index_receipts_on_purchase_order_id"
    t.index ["receipt_no"], name: "index_receipts_on_receipt_no"
  end

  create_table "role_assignments", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "user_id", null: false
    t.bigint "role_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "user_id", "role_id"], name: "idx_role_assignments_tenant", unique: true
    t.index ["organization_id"], name: "index_role_assignments_on_organization_id"
    t.index ["role_id"], name: "index_role_assignments_on_role_id"
    t.index ["user_id"], name: "index_role_assignments_on_user_id"
  end

  create_table "role_permissions", force: :cascade do |t|
    t.bigint "role_id", null: false
    t.bigint "permission_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["permission_id"], name: "index_role_permissions_on_permission_id"
    t.index ["role_id"], name: "index_role_permissions_on_role_id"
  end

  create_table "roles", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_roles_on_name"
    t.index ["organization_id"], name: "index_roles_on_organization_id"
  end

  create_table "sales_order_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "sales_order_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.bigint "unit_price_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_sales_order_lines_on_organization_id"
    t.index ["product_id"], name: "index_sales_order_lines_on_product_id"
    t.index ["sales_order_id"], name: "index_sales_order_lines_on_sales_order_id"
  end

  create_table "sales_orders", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "customer_id", null: false
    t.string "order_no"
    t.integer "status", default: 0
    t.datetime "ordered_at"
    t.string "currency", limit: 3, default: "USD"
    t.bigint "total_cents", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["customer_id"], name: "index_sales_orders_on_customer_id"
    t.index ["order_no"], name: "index_sales_orders_on_order_no"
    t.index ["organization_id", "order_no"], name: "index_sales_orders_on_organization_id_and_order_no", unique: true
    t.index ["organization_id"], name: "index_sales_orders_on_organization_id"
  end

  create_table "shipment_lines", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "shipment_id", null: false
    t.bigint "product_id", null: false
    t.integer "qty"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_shipment_lines_on_organization_id"
    t.index ["product_id"], name: "index_shipment_lines_on_product_id"
    t.index ["shipment_id"], name: "index_shipment_lines_on_shipment_id"
  end

  create_table "shipments", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "sales_order_id", null: false
    t.string "shipment_no"
    t.integer "status", default: 0
    t.datetime "shipped_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "shipment_no"], name: "index_shipments_on_organization_id_and_shipment_no", unique: true
    t.index ["organization_id"], name: "index_shipments_on_organization_id"
    t.index ["sales_order_id"], name: "index_shipments_on_sales_order_id"
    t.index ["shipment_no"], name: "index_shipments_on_shipment_no"
  end

  create_table "stock_items", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "product_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "on_hand", default: 0
    t.integer "reserved", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "warehouse_id", "product_id"], name: "idx_stock_items_tenant_wh_prod", unique: true
    t.index ["organization_id"], name: "index_stock_items_on_organization_id"
    t.index ["product_id"], name: "index_stock_items_on_product_id"
    t.index ["warehouse_id"], name: "index_stock_items_on_warehouse_id"
    t.check_constraint "on_hand >= 0", name: "chk_on_hand_nonneg"
  end

  create_table "stock_movements", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "product_id", null: false
    t.bigint "warehouse_id", null: false
    t.integer "qty_delta"
    t.string "reason"
    t.string "reference_type", null: false
    t.bigint "reference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_stock_movements_on_organization_id"
    t.index ["product_id"], name: "index_stock_movements_on_product_id"
    t.index ["reference_type", "reference_id"], name: "index_stock_movements_on_reference"
    t.index ["warehouse_id"], name: "index_stock_movements_on_warehouse_id"
  end

  create_table "users", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "email"
    t.string "encrypted_password"
    t.string "first_name"
    t.string "last_name"
    t.string "role"
    t.string "time_zone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email"
    t.index ["organization_id"], name: "index_users_on_organization_id"
  end

  create_table "vendor_payments", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.bigint "bill_id", null: false
    t.bigint "amount_cents", default: 0
    t.string "currency", limit: 3, default: "USD"
    t.string "method"
    t.datetime "paid_at"
    t.string "reference_no"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["bill_id"], name: "index_vendor_payments_on_bill_id"
    t.index ["organization_id"], name: "index_vendor_payments_on_organization_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "tax_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id", "name"], name: "index_vendors_on_organization_id_and_name"
    t.index ["organization_id"], name: "index_vendors_on_organization_id"
  end

  create_table "warehouses", force: :cascade do |t|
    t.bigint "organization_id", null: false
    t.string "code"
    t.string "name"
    t.text "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["code"], name: "index_warehouses_on_code"
    t.index ["organization_id", "code"], name: "index_warehouses_on_organization_id_and_code", unique: true
    t.index ["organization_id"], name: "index_warehouses_on_organization_id"
  end

  add_foreign_key "audit_events", "organizations"
  add_foreign_key "audit_events", "users"
  add_foreign_key "bill_lines", "bills"
  add_foreign_key "bill_lines", "organizations"
  add_foreign_key "bill_lines", "products"
  add_foreign_key "bills", "organizations"
  add_foreign_key "bills", "vendors"
  add_foreign_key "customers", "organizations"
  add_foreign_key "financial_periods", "organizations"
  add_foreign_key "invoice_lines", "invoices"
  add_foreign_key "invoice_lines", "organizations"
  add_foreign_key "invoice_lines", "products"
  add_foreign_key "invoices", "organizations"
  add_foreign_key "invoices", "sales_orders"
  add_foreign_key "journal_entries", "organizations"
  add_foreign_key "ledger_accounts", "organizations"
  add_foreign_key "payments", "invoices"
  add_foreign_key "payments", "organizations"
  add_foreign_key "products", "organizations"
  add_foreign_key "purchase_order_lines", "organizations"
  add_foreign_key "purchase_order_lines", "products"
  add_foreign_key "purchase_order_lines", "purchase_orders"
  add_foreign_key "purchase_orders", "organizations"
  add_foreign_key "purchase_orders", "vendors"
  add_foreign_key "receipt_lines", "organizations"
  add_foreign_key "receipt_lines", "products"
  add_foreign_key "receipt_lines", "receipts"
  add_foreign_key "receipts", "organizations"
  add_foreign_key "receipts", "purchase_orders"
  add_foreign_key "role_assignments", "organizations"
  add_foreign_key "role_assignments", "roles"
  add_foreign_key "role_assignments", "users"
  add_foreign_key "role_permissions", "permissions"
  add_foreign_key "role_permissions", "roles"
  add_foreign_key "roles", "organizations"
  add_foreign_key "sales_order_lines", "organizations"
  add_foreign_key "sales_order_lines", "products"
  add_foreign_key "sales_order_lines", "sales_orders"
  add_foreign_key "sales_orders", "customers"
  add_foreign_key "sales_orders", "organizations"
  add_foreign_key "shipment_lines", "organizations"
  add_foreign_key "shipment_lines", "products"
  add_foreign_key "shipment_lines", "shipments"
  add_foreign_key "shipments", "organizations"
  add_foreign_key "shipments", "sales_orders"
  add_foreign_key "stock_items", "organizations"
  add_foreign_key "stock_items", "products"
  add_foreign_key "stock_items", "warehouses"
  add_foreign_key "stock_movements", "organizations"
  add_foreign_key "stock_movements", "products"
  add_foreign_key "stock_movements", "warehouses"
  add_foreign_key "users", "organizations"
  add_foreign_key "vendor_payments", "bills"
  add_foreign_key "vendor_payments", "organizations"
  add_foreign_key "vendors", "organizations"
  add_foreign_key "warehouses", "organizations"
end
