class ReportPdf < Prawn::Document
  
  def initialize(post)
    
    super(template: "rer", :page_layout => :portrait, :page_size=> "A4", :margin => 0)
    @size = [595.28, 841.89]
    @post = post
    @arr = @post.attributes.keys - ["id", "created_at", "updated_at"]
    # for 5 on every text part
    @sum_pad = 45
    
    # raw text height
    # page size - sum of pad
    @text_h  = 600 - @sum_pad

    # default font size
    @font_size = 16
    
    # max numbers of lines
    # if font size 16
    @max_number_of_lines = (@text_h / @font_size).to_i
    sum_of_lines
    create_background
    
    text_content
  
   
    
  end


  def sum_of_lines
    @arr.map {|x| @post[x].length}.sum 
  end

  def set_font_size
    s_lines  = sum_of_lines/((560 )/11.5)
    #num_lines = @text_h/s_lines
    if s_lines < @max_number_of_lines
      return 16
    else
      return @text_h/s_lines
    end
      
  
  end
  
  def text_content
    font_size = set_font_size
    w = width_of("w", size: font_size)
    chars_in_line = (560 )/w
    pry.binding
     move_cursor_to 718
    @arr.each_with_index do |text, ind|
      bounding_box([10, cursor], :width => 560) do 
      text_box @post[text], size: font_size, width: 560, at: [10, cursor]
      
      
      end
      line_in_text = @post[text].length/chars_in_line
      if line_in_text < 1
        t = 1.5
      else 
        t = line_in_text
      end
      move_down t * (font_size + 1)
      move_down 5
    end
   
    
  end
  def create_background
    #ActionController::Base.helpers.asset_path("background.jpg")
    #
    image "#{Rails.root}/app/assets/images/background.jpg" , :at  => [0, @size[1]],
        :fit => @size
  end
  

    
  
end


