require 'date'

class UsersController < ApplicationController

  def index
    @users = [
      User.new(id: 1, name: 'Oleg', username: 'patrik!', avatar_url: 'https://pp.userapi.com/c824204/v824204653/c9b78/-ylFYNcR0lY.jpg'),
      User.new(id: 2, name: 'Igor', username: 'egoik')
    ]
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(name: 'Oleg', username: 'patrik!', avatar_url: 'https://pp.userapi.com/c824204/v824204653/c9b78/-ylFYNcR0lY.jpg')
    @questions = [
      Question.new(text: 'Как дела?', created_at: Date.parse('27.03.2016')),
      Question.new(text: 'Идешь гулять?', created_at: Date.parse('28.03.2016'))
    ]

    @new_question = Question.new
  end
end
