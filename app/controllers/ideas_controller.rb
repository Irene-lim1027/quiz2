class IdeasController < ApplicationController

    before_action :find_idea, only:[:show, :edit, :update, :destroy]
    
    def index
        @ideas = Idea.all.order('created_at DESC')
    end

    def new
        @idea = Idea.new
    end

    def create
        @idea = Idea.new params.require(:idea).permit(:title, :description)

        if @idea.save
            flash[:notice] = "Idea created successfully"
            redirect_to idea_path(@idea)
        else
            render :new
        end
    end

    def show
        @idea = Idea.find params[:id]
    end

    def edit
        @idea = Idea.find params[:id]
    end

    def update
        @idea = Idea.find params[:id]
            if @idea.update{params.require(:idea).permit(:title, :description)}
                redirect_to idea_path(@idea)
            else
                render :edit
        end
    end

    def delete
        @idea =Idea.find params[:id]
        @idea.destroy
        redirect_to ideas_path
    end


    private
        def find_idea
            @idea =Idea.find params[:id]
        end



end
