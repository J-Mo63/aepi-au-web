class ForumsController < ApplicationController
  def index
      @forums = Forum.all
  end

  def show
  end

  def edit
  end

  def new
  end
end
