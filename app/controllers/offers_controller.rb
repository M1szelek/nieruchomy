class OffersController < ApplicationController
  before_action :set_offer, only: [:show, :edit, :update, :destroy]
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
 

  # GET /offers
  # GET /offers.json
  def index
    @search = Offer.search do
      fulltext params[:search]
      order_by :created_at, :desc
      paginate(:page => params[:page] || 1, :per_page => 15)
    end


    @offers = @search.results
    @offer_attachments = OfferAttachment.all
      
    #@offers = Offer.paginate(page: params[:page])
    @count=1
   
   
   
  end


  # GET /offers/1
  # GET /offers/1.json
  def show
    @offer = Offer.find(params[:id])
    @comments = @offer.comments
    @offer_attachments =@offer.offer_attachments 
    @comment_add=Comment.new
    
    
    
  end

  # GET /offers/new
  def new
    @offer = Offer.new
    @offer_attachment = @offer.offer_attachments.build
  end

  # GET /offers/1/edit
  def edit
  end

  # POST /offers
  # POST /offers.json
  def create
    @offer = current_user.offers.build(offer_params)
    @offer_attachment = OfferAttachment.new
   
    if @offer.save
      
      params[:offer_attachments]['image'].each do |a|
        
      @offer_attachment = @offer.offer_attachments.create!( :offer_id => @offer.id , :image => a )
      
      end
      
      flash[:success] = "Offer created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/add'
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
    redirect_to :back
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
private
   def offer_params
      params.require(:offer).permit( post_attachments_attributes: [:id, :offer_id, :image])
   end
     def offer_attachment_params
      params.require(:offer_attachment).permit(:offer_id, :image)
    end
  
