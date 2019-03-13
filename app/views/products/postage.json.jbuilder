json.array! @seller do |seller_method|
  json.id   seller_method.id
  json.name   seller_method.name
end

json.array! @buyer do |buyer_method|
  json.id   buyer_method.id
  json.name   buyer_method.name
end
