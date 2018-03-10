class CommentsController < ApplicationController
  #before_action :get_parent
  before_action :find_commentable

  def new
    #binding.pry
    @comment = Comment.new
    #@user = User.new
  end

  def create
    #binding.pry
    #new_params = comments_params
    #new_params[:user_id] = current_user.id
    #@comment = @parent.comments.build(comment_params)
    #raise comment_params.inspect
    #@comment.username = @user.username
    #binding.pry
    #@comment.user_id = current_user.id
    #comments = Comment.all
    @comment = @commentable.comments.new(comment_params)

    if @comment.save
      redirect_to patterns_path, notice: "Thank you for your comment!"
    else
      redirect_to patterns_path, notice: "Your comment wasn't posted!"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :title)
  end

  def find_commentable
    @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
    @commentable = Pattern.find_by_id(params[:pattern_id]) if params[:pattern_id]
  end

  #def get_parent
  #  @parent = Pattern.find_by_id(params[:pattern_id]) if params[:pattern_id]
  #  @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

  #  redirect_to root_path unless defined?(@parent)
  #else
  #  comment = Comment.create(comment_params)
  #  redirect_to comment.pattern
  #end

  #private

  #def comment_params
  #  params.require(:comment).permit(:content, :pattern_id, :user_id, user_attributes:[:username])
  #end
end
