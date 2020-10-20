json.extract! invitation, :id, :accepted, :created_at, :updated_at
json.url invitation_url(invitation, format: :json)
