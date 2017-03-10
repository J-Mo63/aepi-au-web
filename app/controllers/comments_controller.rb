class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def create
    @comment = Comment.new(comment_params)

    if @comment.save
      redirect_to post_path(@comment.post)
    else
      redirect_to post_path(@comment.post)
    end
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to @comment.post
    else
      redirect_to @comment.post
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post
    @comment.destroy
    redirect_to post_path(post)
  end

  private

    def comment_params
      params.require(:comment).permit(:post_id, :body, :creator_id)
    end
end
