class CommentsController < ApplicationController
  before_action :set_pattern

  def index
    @comments = @pattern.comments

    respond_to do |format|
     format.html
     format.json {render json: @comments}
    end
  end

  def create
    @comment = @pattern.comments.build(comments_params)
    if @comment.save

      render json: @comment
    else
      render "patterns/show"
    end
  end

  #def next
  #  @next_comment = @comment.next
  #  render json: @next_comment
  #end

  def show
    @comment = Comment.find(params[:id])

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

end
