module HashtagsHelper
  def render_hashtag_link(obj)
    obj.gsub(/#[[:alpha:]]+/){ |word| link_to word, "/hashtags/#{word.downcase.delete('#')}"}.html_safe
  end
end
