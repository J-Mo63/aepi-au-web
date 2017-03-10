class PostsController < ApplicationController

  def show
    @post = Post.find(params[:id])
    @board = @post.board
    @forum = @board.forum
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    board = @post.board
    @post.destroy
    redirect_to board_path(board)
  end

  private

    def post_params
      params.require(:post).permit(:board_id, :title, :body)
    end
end
