json.array!(@offer_attachments) do |offer_attachment|
  json.extract! offer_attachment, :id, :offer_id, :image
  json.url offer_attachment_url(offer_attachment, format: :json)
end
