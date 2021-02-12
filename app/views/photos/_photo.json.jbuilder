json.extract! photo, :id, :original, :effect, :output_image, :created_at, :updated_at
json.url photo_url(photo, format: :json)
