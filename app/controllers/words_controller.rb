class WordsController < ApplicationController

  def new
    @word = Word.new
    2.times do |x|
      @word.word_assets.build 
    end
  end

  def show
    
    @word = Word.includes(:word_assets).find(params[:id])
    word_assets = @word.word_assets
    f1, f2 =  word_assets.map{|f| f.asset.path }
    @f1 = File.basename(f1)
    @f2 = File.basename(f2)
    @output = diff_in_files(f1,f2)
     
  end
  
  def create 
    @word = Word.new(word_params)
    respond_to do |format|
      
      if @word.save
        format.html { redirect_to :action => "show", :id => @word.id}
        format.json { render :show, status: :created, location: @word_attachment }
      else
        format.html { render :new }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private
   def word_params
      params.require(:word).permit(:word_assets_attributes => [:asset])
   end

   def diff_in_files(file1, file2)
       if Diffy::Diff.new(file1, file2, source: "files")
           .to_s(:text).eql? ""
         return nil
       else
         # without file.read
         # broken pipe error
         t1 = File.read(file1)
         t2 = File.read(file2)
         @text1 = Yomu.read :text, t1
         @text2 = Yomu.read :text, t2
         #text1, text2 = [file1, file2].map {|x| Yomu.new(x).text}
         #@text1 = Yomu.new(file1).text
         #@text2 = Yomu.new(file2).text
        
         return Diffy::Diff.new(@text1, @text2).to_s(:html)
       
     
   
       end
   end
       
       
     
end
