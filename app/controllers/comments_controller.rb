class CommentsController < ApplicationController
  before_action :get_parent

  def new
    @comment = @parent.comments.build
  end

  def create
    @comment = @parent.comments.build(params[:comment])

    if @comment.save
      redirect_to pattern_path(@comment.pattern), notice: "Thank you for your comment!"
    else
      render :new
    end
  end

  protected

  def get_parent
    @parent = Pattern.find_by_id(params[:pattern_id]) if params[:pattern_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]

    redirect_to root_path unless defined?(@parent)
  end
    #comment = Comment.create(comment_params)
    #redirect_to comment.pattern
  #end

  #private

  #def comment_params
  #  params.require(:comment).permit(:content, :pattern_id, :user_id, user_attributes:[:username])
  #end
end
