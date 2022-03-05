# frozen_string_literal: true

json.extract!(carousel, :id, :pic_name, :created_at, :updated_at)
json.url(carousel_url(carousel, format: :json))
