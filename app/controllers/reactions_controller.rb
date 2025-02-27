class ReactionsController < ApplicationController

    def new_user_reaction

        @user = current_user

        @type = params[:reaction_type]

        @article = Article.find(params[:article_id]) if params[:article_id]

        @comment = Comment.find(params[:comment_id]) if params[:comment_id]

        @kind = params[:kind]
        
        respond_to do |format|

            (@type == "comment") ? reaction_comment = Reaction.find_by(user_id: @user,  comment_id: @comment.id) : reaction_article = Reaction.find_by(user_id: @user.id, article_id: @article.id)

            if reaction_article || reaction_comment

                format.html { redirect_to article_path(@article), notice: 'You already reacted to this article' }
            else
                (@type == "article") ? @reaction = Reaction.new(user_id: @user.id, article_id: @article.id, reaction_type: @type, kind: @kind) : @reaction = Reaction.new(user_id: @user.id, comment_id: @comment.id, reaction_type: @type, kind: @kind)
                if @reaction.save!
                    format.html { redirect_to article_path(@article), notice: 'Reaction was successfully created.' }
                else
                    format.html { redirect_to article_path(@article), notice: 'Something went wrong' }
                end
            end
        end
    end
end
    
