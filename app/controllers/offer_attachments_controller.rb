class OfferAttachmentsController < ApplicationController
  before_action :set_offer_attachment, only: [:show, :edit, :update, :destroy]

  # GET /offer_attachments
  # GET /offer_attachments.json
  def index
    @offer_attachments = OfferAttachment.all
  end

  # GET /offer_attachments/1
  # GET /offer_attachments/1.json
  def show
  end

  # GET /offer_attachments/new
  def new
    @offer_attachment = OfferAttachment.new
  end

  # GET /offer_attachments/1/edit
  def edit
  end

  # POST /offer_attachments
  # POST /offer_attachments.json
  def create
    @offer_attachment = OfferAttachment.new(offer_attachment_params)

    respond_to do |format|
      if @offer_attachment.save
        format.html { redirect_to @offer_attachment, notice: 'Offer attachment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @offer_attachment }
      else
        format.html { render action: 'new' }
        format.json { render json: @offer_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /offer_attachments/1
  # PATCH/PUT /offer_attachments/1.json
  def update
    respond_to do |format|
      if @offer_attachment.update(offer_attachment_params)
        format.html { redirect_to @offer_attachment, notice: 'Offer attachment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @offer_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /offer_attachments/1
  # DELETE /offer_attachments/1.json
  def destroy
    @offer_attachment.destroy
    respond_to do |format|
      format.html { redirect_to offer_attachments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_offer_attachment
      @offer_attachment = OfferAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def offer_attachment_params
      params.require(:offer_attachment).permit(:offer_id, :image)
    end
end
