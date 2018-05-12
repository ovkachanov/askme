class HashtagsController < ApplicationController
  def show
    @hashtag = Hashtag.find_by(name: params[:name])
    @questions = @hashtag.questions
    @hashtags = Hashtag.all
  end
end
