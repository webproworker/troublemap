class CommentsController < ApplicationController

  def create
    @trouble = Trouble.find(params[:trouble_id])
    @comment = @trouble.comments.create(params[:comment].permit(:commenter, :body))
    redirect_to trouble_path(@trouble)
  end

  def destroy
    @trouble = Trouble.find(params[:trouble_id])
    @comment = @trouble.comments.find(params[:id])
    @comment.destroy
    redirect_to trouble_path(@trouble)
  end

end
