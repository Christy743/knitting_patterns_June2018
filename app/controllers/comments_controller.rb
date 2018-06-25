class CommentsController < ApplicationController
  #before_action :find_commentable
  before_action :set_pattern

  def index
    @comments = @pattern.comments
  end

  #def new
  #  @comment = Comment.new
  #end

  def create
    @comment = @pattern.comments.build(comments_params)
    #@comment = @commentable.comments.build(comment_params)
    if @comment.save
      #render "patterns/show"
      render "comments/show", :layout => false
    else
      render "patterns/show"
    end
  end

  private

  def comments_params
    params.require(:comment).permit(:content)
  end

  def set_pattern
    @pattern = Pattern.find(params[:pattern_id])
  end

  #def find_commentable
  #  @commentable = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
  #  @commentable = Pattern.find_by_id(params[:pattern_id]) if params[:pattern_id]
  #end

end
