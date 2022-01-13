class PostsController < ApplicationController
    http_basic_authenticate_with name: "rahul", password:"123", except: [:index, :show]
    before_action :set_user
    def index
        @posts = @user.posts
    
    end

    def show
        @post = @user.posts.find(params[:id])
    
    end
    
    def new
        @post = @user.posts.build
    
    end

    def create
        # render plain: params[:post].inspect
        @post = @user.posts.build(post_params)

        if(@post.save)
            redirect_to user_posts_path(@user)
        else
            render 'new'
        end    
    end

    def edit
        @post = @user.posts.find(params[:id])
    end

    def update
        @post = @user.posts.find(params[:id])

        if(@post.update(post_params))
            redirect_to post_path
        else
            render 'edit'
        end    
    end

    def destroy
        @post = @user.posts.find(params[:id])
        @post.destroy
            redirect_to posts_path
    end

    private
    def set_user
        @user = User.find(params[:user_id])
    end
    def post_params
         params.require(:post).permit(:title, :body, :user_id)
    
    end

end
