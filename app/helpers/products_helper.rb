module ProductsHelper

  def fee_decide(product)
    if product.postage_id == 1
      "送料込み"
    else
      "着払い"
    end
  end

  def search_product(category)
    return Product.where(category_id: category.subtree_ids).limit(4).order("created_at DESC")
  end

end
