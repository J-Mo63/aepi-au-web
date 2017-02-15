class ForumsController < ApplicationController

    def index
        @forums = policy_scope(Forum)
    end

    def show
    end

    def edit
    end

    def new
        @forum = authorize Forum.new
    end
end
