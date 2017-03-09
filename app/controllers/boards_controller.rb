class BoardsController < ApplicationController

  def show
    @board = Board.find(params[:id])
    @posts = Post.where(board_id: @board.id)
    @forum = Forum.find(@board.forum)
  end

  def new
    @board = Board.new
  end

  def edit
    @board = Board.find(params[:id])
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      redirect_to forum_path(@board.forum)
    else
      render :new
    end
  end

  def update
    @board = Board.find(params[:id])

    if @board.update(board_params)
      redirect_to @board
    else
      render :edit
    end
  end

  def destroy
    @board = Board.find(params[:id])
    forum = @board.forum
    @board.destroy
    redirect_to forum_path(forum)
  end

  private

  def board_params
    params.require(:board).permit(:forum_id, :name, :description)
  end
end
