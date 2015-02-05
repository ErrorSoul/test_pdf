class PostsController < ApplicationController
  #respond_to :pdf, only: [:show, :create]
  require 'pry'
  def new

    @post = Post.new
  end
  

  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html
      format.pdf do
        pdf = ReportPdf.new(@post)
        
          
        send_data pdf.render,  type: 'application/pdf', disposition: "inline"
      end
    end
  end
  def create
    @post = Post.new(post_params)
    
      if @post.save
        
        
          redirect_to :action => 'show', :format => 'pdf', :id => @post.id
          
      else
        respond_to do |format|
        format.html { render action: 'new' }
      end
      
      end

    
  end
private
  def post_params
    params.require(:post).permit(:text1, :text2, :text3,
                                 :text4, :text5, :text6,
                                 :text7, :text8, :text9,
                                 :text10)
  end
end



