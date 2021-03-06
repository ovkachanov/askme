class UsersController < ApplicationController
  before_action :load_user, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @users = User.all
    @hashtags = Hashtag.all
  end

  def new
    redirect_to root_url, alert: 'Вы уже залогинены' if current_user.present?
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if current_user.present?
      redirect_to root_url, alert: 'Вы уже залогинены'
      return
    end

    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user), notice: "Пользователь #{@user.username} зарегестрирован!"
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены'
    else
      render 'edit'
    end
  end

  def show
    @questions = @user.questions.order(created_at: :desc)
    @new_question = @user.questions.build
    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: "Пользователь #{@user.name} удален!"
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    @user ||= User.find params[:id]
  end

  def user_params
    params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :avatar_url, :background)
  end
end
