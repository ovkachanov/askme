module HashtagsHelper
  def render_hashtag_link_question(text)
    text.gsub(/#\w+/){ |word| link_to word, "/hashtags/#{word.delete('#')}"}.html_safe
  end


  def render_hashtag_link_answer(answer)
    answer.gsub(/#\w+/){ |word| link_to word, "/hashtags/#{word.delete('#')}"}.html_safe
  end
end
