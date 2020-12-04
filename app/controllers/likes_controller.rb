class LikesController < ApplicationController

    def create
        idea = Idea.find params[:idea_id]
        like = Like.new(idea: idea, user:current_user)
        
        if !can?(:like, idea)
            flash[:danger] = "You can't like your own idea"
        elsif like.save
            flash[:success] = "Idea liked"
        else
            flash[:danger] = like.errors.full_messages.join(",")
        end
            redirect_to idea_path(idea)
        end
    

    def destroy
        like = current_user.likes.find params[:id]
        if !(can?(:destroy, like))
            like.destroy
            flash[:warning] = "Unliked Idea" 
            redirect_to idea_path(like.idea)
        else
            flash[:warning] = "It's rude to unlike something you've already liked"
            redirect_to idea_path(like.idea)
        end
        
    end
end