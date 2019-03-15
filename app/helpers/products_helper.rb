module ProductsHelper

  def fee_decide(product)
    if product.postage_id == 1
      "送料込み"
    else
      "着払い"
    end
  end

end
