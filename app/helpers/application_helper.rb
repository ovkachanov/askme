module ApplicationHelper
  def user_avatar(user)
    if user.avatar_url.present?
      user.avatar_url
    else
      asset_path 'avatar.jpg'
    end
  end

  def user_background(user)
    if user.background.present?
      user.background
    else
      user.background = "#005a55"
    end
  end

  def sklonenie(count, one_obj, three_obj, many_obj)
    if count == nil || !count.is_a?(Numeric)
      count = 0
    end

    if count >= 11 && count <= 14
      return many_obj
    end

    ostatok = count % 10
    ostatok_one_hundred = count % 100

    if ostatok_one_hundred.between?(11, 14)
      return many_obj
    end

    if ostatok == 1
      return one_obj
    end

    if ostatok >= 2 && ostatok <= 4
      return three_obj
    end

    if (ostatok >= 5 && ostatok <= 9) || ostatok == 0
      return many_obj
    end
  end

  def fa_icon(icon_class)
    content_tag 'span', '', class: "fa fa-#{icon_class}"
  end
end
