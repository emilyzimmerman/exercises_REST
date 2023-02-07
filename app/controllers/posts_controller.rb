class PostsController < ApplicationController
    
    #GET all
    def index
        @posts = Post.all
    end

    #Show a specific
    def show 
        @post = Post.find(params[:id])
    end

    #edit a specific resource
    def edit
        @post = Post.find(params[:id])  
    end

    def update 
        @post = Post.find(params[:id])  

        if @post.update(title: params[:post][:title], body: params[:post][:body])
            redirect_to post_path(@post)
        else
            render :edit, status: :unprocessable_enrty
        end
    end

    def new
        @post = Post.new 
    end

    def create 
        @post = Post.new(title: params[:post][:title], body: params[:post][:body])

        #executes if post is save
        if @post.save
            flash[:message] = "Post saved"
            #redirects to index page
            redirect_to posts_path
        else 
            render :new, status: :unprocessable_entity
        end
    end

    def destroy
        #deletes post
        @post = Post.find(params[:id])

        @post.destroy 

        redirect_to post_path
    end

end