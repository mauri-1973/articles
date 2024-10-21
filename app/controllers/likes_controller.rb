class LikesController < ApplicationController

    def new_user_like

        @user = current_user

        @type = params[:reaction_type]

        @post = Post.find(params[:post_id]) if params[:post_id]

        @comment = Commentnews.find(params[:comment_id]) if params[:comment_id]

        @kind = params[:kind]
        
        respond_to do |format|

            if @type == "likes"

                ( user_signed_in? ) ? @reaction = 1 : @reaction = 2
                
                if @reaction == 1

                    @reaction = Like.new(user_id: @user.id, post_id: @post.id, type_react: params[:kind])

                else

                    @reaction = Like.new(user_id: 0, post_id: @post.id, type_react: params[:kind])

                end

                if @reaction.save!

                    format.html { redirect_to posts_path , notice: 'Se ha ingresado correctamente su reacción' }

                else

                    format.html { redirect_to post_path, notice: 'No hemos podido ingresar su reacción' }

                end
                
            
            else

                format.html { redirect_to posts_path , notice: 'You already reacted to this article' }

            end
        end
    end
end
    
