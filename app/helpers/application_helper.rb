module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def sklonenie(count)
    if count == nil || !count.is_a?(Numeric)
      count = 0
    end

    if count >= 11 && count <= 14
      return "вопросов"
    end

    ostatok = count % 10
    ostatok_one_hundred = count % 100

    if ostatok_one_hundred.between?(11, 14)
      return "вопросов"
    end

    if ostatok == 1
      return "вопрос"
    end

    if ostatok >= 2 && ostatok <= 4
      return "вопроса"
    end

    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return "вопросов"
    end
  end
end
