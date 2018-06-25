class CommentsController < ApplicationController
  #before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @pattern.comments.build(comment_params)
    #@comment = @commentable.comments.build(comment_params)
    #if @comment.save
    #  redirect_to patterns_path, notice: "Thank you for your comment!"
    #else
    #  render :new
    #end
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :content, :commentable_id, :commentable_type)
  end

  #def find_commentable
  #  @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  #  @commentable = Pattern.find_by_id(params[:pattern_id]) if params[:pattern_id]
  #end

end
