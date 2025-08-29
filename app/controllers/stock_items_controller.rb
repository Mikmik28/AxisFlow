class StockItemsController < ApplicationController
  before_action :set_stock_item, only: %i[ show edit update destroy ]

  # GET /stock_items or /stock_items.json
  def index
    @stock_items = StockItem.all
  end

  # GET /stock_items/1 or /stock_items/1.json
  def show
  end

  # GET /stock_items/new
  def new
    @stock_item = StockItem.new
  end

  # GET /stock_items/1/edit
  def edit
  end

  # POST /stock_items or /stock_items.json
  def create
    @stock_item = StockItem.new(stock_item_params)

    respond_to do |format|
      if @stock_item.save
        format.html { redirect_to @stock_item, notice: "Stock item was successfully created." }
        format.json { render :show, status: :created, location: @stock_item }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /stock_items/1 or /stock_items/1.json
  def update
    respond_to do |format|
      if @stock_item.update(stock_item_params)
        format.html { redirect_to @stock_item, notice: "Stock item was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @stock_item }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @stock_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_items/1 or /stock_items/1.json
  def destroy
    @stock_item.destroy!

    respond_to do |format|
      format.html { redirect_to stock_items_path, notice: "Stock item was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_stock_item
      @stock_item = StockItem.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def stock_item_params
      params.expect(stock_item: [ :product_id, :warehouse_id, :on_hand, :reserved ])
    end
end
