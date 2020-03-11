json.extract! burger, :id, :code, :name, :price, :image, :nutriscore, :nutriments, :created_at, :updated_at
json.url burger_url(burger, format: :json)
