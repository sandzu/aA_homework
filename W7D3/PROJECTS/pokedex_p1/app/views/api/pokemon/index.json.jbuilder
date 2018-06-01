# @pokemon.each do |poke|
#   json.set! poke.id do
#     json.extract! poke, :id, :name
#     json.image_url asset_path(poke.image_url)
#   end
# end
#

@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids;
    json.image_url asset_path(poke.image_url)
  end
end
