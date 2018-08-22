class PostsController < ApplicationController
    before_action :find_params, only: [:show, :edit, :update, :destroy]
    def index
        @posts = Post.all.order('created_at DESC')
    end
    
    def new
    
        @post = Post.new()
        
    end
    
    def show
        #@post = Post.find(params[:id])
    end
    
    def create
        @post = Post.new(post_create)
        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def update
        #@post = Post.find(params[:id])
        if @post.update(post_create)
            redirect_to @post
        else
            render 'edit'
        end
    end
    
    def edit
        #@post = Post.find(params[:id])
    end
    
    def destroy
        #@post = Post.find(params[:id])
        
        @post.destroy
        
        redirect_to root_path
    
    end
    
    
    
    
    private
    
    def post_create
        #params.permit(:title, :content)
        params.require(:post).permit(:title, :content)
    end
    
    def find_params
            @post = Post.find(params[:id])
    end
end
