FactoryBot.define do
  factory :product do
    name                     { "人形" }
    detail                   { "なんで捨てたの?" }
    category_id              { 1 }
    condition                { 4 }
    postage_id               { 1 }
    shipping_method_id       { 1 }
    prefecture_id            { 1 }
    date                     { 2 }
    price                    { 700 }

    association :category, factory: :category
    association :postage, factory: :postage
    association :shipping_method, factory: :shipping_method
    association :prefecture, factory: :prefecture
  end


  factory :product_with_image, class: Product do
    name                     { "人形" }
    detail                   { "なんで捨てたの?" }
    category_id              { 1 }
    condition                { 4 }
    postage_id               { 1 }
    shipping_method_id       { 1 }
    prefecture_id            { 1 }
    date                     { 2 }
    price                    { 700 }

    association :category, factory: :category
    association :postage, factory: :postage
    association :shipping_method, factory: :shipping_method
    association :prefecture, factory: :prefecture

    after( :create ) do |product|
      create :image, product: product
    end
  end

end
