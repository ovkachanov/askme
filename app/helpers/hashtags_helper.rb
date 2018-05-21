module HashtagsHelper
  def render_hashtag_link(obj)
    if hashtag_name_valid?(obj)
      obj.gsub(/#[\p{L}0-9_]{1,35}/){ |word| link_to word, "/hashtags/#{word.downcase.delete('#')}"}.html_safe
    else
      obj
    end
  end

  def hashtag_name_valid?(obj)
    obj.length <= 35
  end
end
