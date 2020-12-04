class ReviewsController < ApplicationController
    

    def create
        @idea = Idea.find params[:idea_id]
        @review = Review.new params.require(:review).permit(:body)
        @review.idea = @idea
        @review.user = current_user

        if @review.save
            redirect_to idea_path(@idea)
        else
            render idea_path
        end
    end

    def destroy 
        
        @review= Review.find params[:id]
        if can? :crud, @review
            @review.destroy
            redirect_to idea_path(@review.idea)
        else
            head :unauthrize
        end
    end


end
