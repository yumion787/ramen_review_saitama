class CommentsController < ApplicationController
    def create
      store = Store.find(params[:store_id])
      @comment = Store.comments.build(comment_params)
    # @comment = Comment.new(comment_params)
    # @comment.user_id = current_user.id
      if @comment.save
        redirect_back(fallback_location: root_path)
      else
        redirect_back(fallback_location: root_path)
      end
    end
    
    
  
  private
  
  def comment_params
     params.require(:comment).permit(:content) 
  end
  
end
