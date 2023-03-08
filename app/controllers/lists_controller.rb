class ListsController < ApplicationController
  before_action :set_list, only: %i[ show edit update destroy ]

  # GET /lists or /lists.json
  def index
    puts "--------------------------"
    @list = List.new
    @lists = List.all.order(completed: :asc)
  end

  def uncompleted
    puts "--------------------------11111"
    @lists = List.all.where(completed: false).order(:desc)
    @list = List.new
  end

  def delete_all
    List.where(completed: true).delete_all
    redirect_to lists_path

  end

  def delete_all_items
    @lists = List.all.destroy_all
    redirect_to lists_path
  end

  # GET /lists/1 or /lists/1.json
  def show
  end

  # GET /lists/new
  def new
    @list = List.new
  end

  # GET /lists/1/edit
  def edit
  end

  # POST /lists or /lists.json
  def create
    @list = List.new(list_params)

    respond_to do |format|
      if @list.save
        format.html { redirect_to lists_url, notice: "List was successfully created." }
        format.json { render :show, status: :created, location: @list }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  def completed
    @lists = List.all.where(completed: true)
    @list = List.new
    render "index"
  end


  def search
  @lists=List.where(description: params[:description])
  @list = List.new
  render  "index"
  
  end

  # PATCH/PUT /lists/1 or /lists/1.json
  def update
    respond_to do |format|
      if @list.update(list_params)
        format.html { redirect_to lists_url, notice: "List was successfully updated." }
        format.json { render :show, status: :ok, location: @list }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @list.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lists/1 or /lists/1.json
  def destroy
    @list.destroy

    respond_to do |format|
      format.html { redirect_to lists_url, notice: "List was successfully destroyed." }
      format.json { head :no_content }
    end
  end

#  def search
  #  @results=List.where(describtion: params[:id])
 # end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_list
      @list = List.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def list_params
      params.require(:list).permit(:description, :completed,)
    end
end
