class CommentnewssController < ApplicationController
    def create
      @post = Post.find(params[:post_id])
      @comment = @post.commentnewss.build(comment_params)
      @comment.user = current_user if user_signed_in?
  
      if @comment.save
        redirect_to @post, notice: "Comentario añadido."
      else
        redirect_to @post, alert: "No se pudo añadir el comentario."
      end
    end
  
    private
  
    def comment_params
      params.require(:comment).permit(:body)
    end
  end