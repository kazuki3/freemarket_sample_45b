module ProductsHelper

  def fee_decide(product)
    if product.postage_id == 1
      "送料込み"
    else
      "着払い"
    end
  end

  def date_decide(product)
    if product.date == "oneday_twoday"
      "1~2日"
    elsif product.date == "twoday_threeday"
      "2~3日"
    else
      "4~7日"
    end
  end

end
