class PostsController < ApplicationController

	def index
    @posts = policy_scope(Post)
    @posts = @posts.order(:created_at).reverse
  end

  def show
    @post = Post.find(params[:id])
    @board = @post.board
    @comments = Comment.where(post_id: @post.id)
    @comment = Comment.new
  end

  def new
    @post = Post.new
    @boards = Board.all
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to forums_academics_path
    else
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    authorize @post

    if @post.update(post_params)
      redirect_to @post
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post
    board = @post.board
    @post.destroy
    redirect_to board_path(board)
  end

  private

    def post_params
      params.require(:post).permit(:board_id, :title, :body, :creator_id)
    end

end
