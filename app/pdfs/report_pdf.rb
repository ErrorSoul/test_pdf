class ReportPdf < Prawn::Document
  def initialize(post)
    
    super(template: "rer", :page_layout => :portrait, :page_size=> "A4", :margin => 0)
    @post = post
    create_background
    
    #text_content
    text_box "This is a text box, you can control where it will flow by " +
 "specifying the :height and :width options specifying the :height and :width optionsspecifying the :height and :width options specifying the :height and :width options",
 :at => [100, 250],
 :height => 100,
 :width => 100
   
    
  end


  
  def text_content
    
  end
  def create_background
    image "#{Rails.root}/app/assets/images/background.jpg", :at  => [0, 841.89],
        :fit => [595.28, 841.89]
  end
  

    
  
end
