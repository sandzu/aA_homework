json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids;
json.image_url asset_path(@pokemon.image_url)
json.array! @items, :name, :price, :happiness, :image_url;

# json.pokemon do
#   json.extract! @pokemon, :id, :name, :attack, :defense, :moves, :poke_type, :item_ids
#   json.image_url asset_path(@pokemon.image_url)
# enabled
#
# json.items do
#   @pokemon.items.each do |item|
#     json.set! item.id do
#       json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
#     end
#   end
# end
