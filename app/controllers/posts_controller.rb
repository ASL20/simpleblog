class PostsController < ApplicationController
  # Встроенный в девайз фильтр - посылает незалогиненного пользователя
  before_action :authenticate_user!, except: [:show, :index]

  # Задаем объект @post для экшена show
  before_action :set_post, only: [:show]

  # Задаем объект @post от текущего юзера для других действий
  before_action :set_current_user_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def show
    @new_comment = @post.comments.build(params[:comment])
  end

  def new
    @post = current_user.posts.build
  end

  def edit
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post, notice: I18n.t('controllers.posts.created')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: I18n.t('controllers.posts.updated')
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_url, notice: I18n.t('controllers.posts.destroyed')
  end

  private

  def set_current_user_post
    @post = current_user.posts.find(params[:id])
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
