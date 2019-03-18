crumb :root do
  # binding.pry
  link 'メルカリ', root_path
end

crumb :signout do
  link 'ログアウト', user_signout_path
end


# 商品詳細画面　ーーーーーーーーーーーーーーーーーーーーーーーー
crumb :products_category_0 do
@product = Product.find(params[:id])
link @product.category.root.name, product_path
end

crumb :products_category_1 do
@product = Product.find(params[:id])
link @product.category.parent.name, product_path
parent :products_category_0
end

crumb :products_category_2 do
@product = Product.find(params[:id])
link @product.category.name, product_path, class:123
parent :products_category_1
end
# ーーーーーーーーーーーーーーーーーーーーーーーーーーーーーー
