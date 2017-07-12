class BoardsController < ApplicationController

  def show
    @board = Board.find(params[:id])
    @posts = Post.where(board_id: @board.id)
    @posts = @posts.order(created_at: :desc)
  end

  def new
    @board = Board.new
    authorize @board
  end

  def edit
    @board = Board.find(params[:id])
    authorize @board
  end

  def create
    @board = Board.new(board_params)
    authorize @board

    if @board.save
      redirect_to forums_academics_path
    else
      render :new
    end
  end

  def update
    @board = Board.find(params[:id])
    authorize @board

    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    authorize @board
    @board.destroy
    redirect_to forums_academics_path
  end

  private

  def board_params
    params.require(:board).permit(:name, :description, :colour)
  end
end
