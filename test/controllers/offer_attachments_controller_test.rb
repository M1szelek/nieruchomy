require 'test_helper'

class OfferAttachmentsControllerTest < ActionController::TestCase
  setup do
    @offer_attachment = offer_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:offer_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create offer_attachment" do
    assert_difference('OfferAttachment.count') do
      post :create, offer_attachment: { image: @offer_attachment.image, offer_id: @offer_attachment.offer_id }
    end

    assert_redirected_to offer_attachment_path(assigns(:offer_attachment))
  end

  test "should show offer_attachment" do
    get :show, id: @offer_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @offer_attachment
    assert_response :success
  end

  test "should update offer_attachment" do
    patch :update, id: @offer_attachment, offer_attachment: { image: @offer_attachment.image, offer_id: @offer_attachment.offer_id }
    assert_redirected_to offer_attachment_path(assigns(:offer_attachment))
  end

  test "should destroy offer_attachment" do
    assert_difference('OfferAttachment.count', -1) do
      delete :destroy, id: @offer_attachment
    end

    assert_redirected_to offer_attachments_path
  end
end
