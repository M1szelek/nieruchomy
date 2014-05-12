class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
 

  # GET /offers
  # GET /offers.json
  def index
    @offers = Offer.all
  end


  # GET /offers/1
  # GET /offers/1.json
  def show
    @post = Comment.all(:order => "created_at DESC")
    
  end
 def index
    @offers = Offer.paginate(page: params[:page])
  end
  # GET /offers/new
  def new
    @offer = Offer.new
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = current_user.offers.build(offer_params)
    if @offer.save
      flash[:success] = "Offer created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  # PATCH/PUT /offers/1
  # PATCH/PUT /offers/1.json
  def update
    respond_to do |format|
      if @offer.update(offer_params)
        format.html { redirect_to @offer, notice: 'Offer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offers/1
  # DELETE /offers/1.json
  def destroy
    @offer.destroy
    redirect_to root_url
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer
      @offer = Offer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_params
      params.require(:offer).permit(:title, :description, :typeM, :photo, :street, :city, :state, :metrage, :roomcount, :price)
    end

    def correct_user
      @offer = current_user.offers.find_by(id: params[:id])
      redirect_to root_url if @offer.nil?
    end
end
