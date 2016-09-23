json.extract! offer, :id, :offer_title, :text, :description, :amount_to_offer, :proposal_id, :created_at, :updated_at
json.url offer_url(offer, format: :json)