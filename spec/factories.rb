FactoryBot.define do
  factory :merchant do
    name { 'The Market' }
    address { '123 X st.' }
    city { 'Denver' }
    state { 'CO' }
    zip { '01010' }
  end

  factory :item do
    name { 'a product' }
    description { 'Very useful for doing the thing you want' }
    price { 99.99 }
    image { 'https://placehold.it/300x300.jpg' }
    inventory { 100 }
    merchant
  end

  factory :review do
    title { 'I liked this product' }
    content { "I think this product is ok, it's very useful" }
    rating { 3 }
    item
  end
end
