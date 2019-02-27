json.extract! profile, :id, :nickname, :email, :password, :password_confirmation, :self_introduction, :first_name, :last_name, :first_name_kana, :last_name_kana, :birthdate, :zip_code, :prefecture, :city, :ddress1, :ddress2, :phone_number, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
