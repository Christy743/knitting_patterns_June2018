class CommentsController < ApplicationController
  #before_action :find_commentable
  before_action :set_pattern

  def index
    @comments = @pattern.comments

    respond_to do |format|
     format.html
     format.json {render json: @comments}
    end
  end

  #def new
  #  @comment = Comment.new
  #end

  def create
    @comment = @pattern.comments.build(comments_params)
    #@comment = @commentable.comments.build(comment_params)
    if @comment.save

      #respond_to do |format|
      # format.html
      # format.json {render json: @comment}
      #end
      render json: @comment  #this is the line that will render my comment and clear the text_area
      #render "patterns/show"
      #render "comments/show", :layout => false #this does not work to clear my text_area
    else
      render "patterns/show"
    end
  end

  def next
    @next_comment = @comment.next
    render json: @next_comment
  end

  def show
    @comment = Comment.find(params[:id])

    #render json: @comment

    respond_to do |format|
     format.html
     format.json {render json: @comment}
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
