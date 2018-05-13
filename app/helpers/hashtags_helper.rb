module HashtagsHelper
  def render_hashtag_link_question(text)
    text.gsub(/#[[:alpha:]]+/){ |word| link_to word, "/hashtags/#{word.downcase.delete('#')}"}.html_safe
  end


  def render_hashtag_link_answer(answer)
    answer.gsub(/#[[:alpha:]]+/){ |word| link_to word, "/hashtags/#{word.downcase.delete('#')}"}.html_safe
  end
end
