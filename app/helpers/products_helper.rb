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

  def zip_code(profile)
    profile.zip_code.to_s.split(/(?<=^.{3})/).join('-')
  end

  def set_address(profile)
    if profile.address2 == nil
      profile.prefecture + " " + profile.city + profile.address1
    else
      profile.prefecture + " " + profile.city + profile.address1 + profile.address2
    end
  end

  def set_name(profile)
      profile.first_name + " " + profile.last_name
  end

end
