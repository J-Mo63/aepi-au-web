class ForumsController < ApplicationController

    def index
        @forums = policy_scope(Forum)
    end

    def new
        @forum = Forum.new
        authorize @forum
    end

    def create
        @forum = Forum.new(forum_params)
        authorize @forum

        if @forum.save
            redirect_to :action => 'index'
        else
            render :action => 'new'
        end
    end



    def show
    end

    def edit
    end

    private

    def forum_params
      params.require(:forum).permit(:name, :description)
    end
end
