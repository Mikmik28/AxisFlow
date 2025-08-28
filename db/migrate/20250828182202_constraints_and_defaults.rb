class ConstraintsAndDefaults < ActiveRecord::Migration[8.0]
  def change
    change_column_default :audit_events, :data, from: nil, to: {} if table_exists?(:audit_events)

    add_index :products, [ :organization_id, :sku ], unique: true    if table_exists?(:products)
    add_index :warehouses, [ :organization_id, :code ], unique: true  if table_exists?(:warehouses)
    add_index :customers,  [ :organization_id, :name ]                if table_exists?(:customers)
    add_index :vendors,    [ :organization_id, :name ]                if table_exists?(:vendors)

    add_index :sales_orders,  [ :organization_id, :order_no ], unique: true if table_exists?(:sales_orders)
    add_index :invoices,      [ :organization_id, :invoice_no ], unique: true if table_exists?(:invoices)
    add_index :shipments,     [ :organization_id, :shipment_no ], unique: true if table_exists?(:shipments)
    add_index :purchase_orders, [ :organization_id, :po_no ], unique: true if table_exists?(:purchase_orders)
    add_index :receipts,      [ :organization_id, :receipt_no ], unique: true if table_exists?(:receipts)
    add_index :bills,         [ :organization_id, :bill_no ], unique: true if table_exists?(:bills)

    add_index :stock_items, [ :organization_id, :warehouse_id, :product_id ],
              unique: true, name: "idx_stock_items_tenant_wh_prod" if table_exists?(:stock_items)
    add_index :role_assignments, [ :organization_id, :user_id, :role_id ],
              unique: true, name: "idx_role_assignments_tenant" if table_exists?(:role_assignments)
    add_index :ledger_accounts, [ :organization_id, :code ], unique: true if table_exists?(:ledger_accounts)

    %i[
      products sales_orders sales_order_lines invoices invoice_lines payments
      purchase_orders purchase_order_lines bills bill_lines vendor_payments journal_lines
    ].each do |t|
      next unless table_exists?(t)
      change_column_default t, :currency, from: nil, to: "USD" if column_exists?(t, :currency)
      %i[price_cents total_cents unit_price_cents unit_cost_cents amount_cents debit_cents credit_cents].each do |col|
        change_column_default t, col, from: nil, to: 0 if column_exists?(t, col)
      end
    end

    change_column_default :sales_orders,    :status, from: nil, to: 0 if column_exists?(:sales_orders, :status)
    change_column_default :shipments,       :status, from: nil, to: 0 if column_exists?(:shipments, :status)
    change_column_default :invoices,        :status, from: nil, to: 0 if column_exists?(:invoices, :status)
    change_column_default :purchase_orders, :status, from: nil, to: 0 if column_exists?(:purchase_orders, :status)
    change_column_default :bills,           :status, from: nil, to: 0 if column_exists?(:bills, :status)

    change_column_default :stock_items, :on_hand,  from: nil, to: 0 if column_exists?(:stock_items, :on_hand)
    change_column_default :stock_items, :reserved, from: nil, to: 0 if column_exists?(:stock_items, :reserved)

    add_check_constraint :stock_items, "on_hand >= 0", name: "chk_on_hand_nonneg" if table_exists?(:stock_items)
    add_check_constraint :journal_lines, "(debit_cents = 0) <> (credit_cents = 0)", name: "chk_single_sided" if table_exists?(:journal_lines)
  end
end
