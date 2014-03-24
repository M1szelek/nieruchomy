json.array!(@offers) do |offer|
  json.extract! offer, :id, :title, :type, :photo, :street, :city, :state, :metrage, :roomcount, :price, :user_id
  json.url offer_url(offer, format: :json)
end
