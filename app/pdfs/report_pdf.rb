class ReportPdf < Prawn::Document
  
  def initialize(post)
    
    super(template: "rer", :page_layout => :portrait, :page_size=> "A4", :margin => 0)
    @size = [595.28, 841.89]
    @post = post
    @arr = @post.attributes.keys - ["id", "created_at", "updated_at"]
    # for 5 on every text part
    @sum_pad = 45
    
    # raw text height
    # raw page size - sum of pad
    @text_h  = 580 - @sum_pad

    # default font size
    @font_size = 16 
    # width without margin
    @width = 560

    # width of 'w'
    # when default font size (16)
    @width_of_w = width_of('w', size: @font_size)
    
    # chars in line with default font
    @chars_in_line = @width / @width_of_w
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
    s_lines  = sum_of_lines / @chars_in_line
    #num_lines = @text_h/s_lines
    if s_lines < @max_number_of_lines
      return 16
    else
      #return @text_h/s_lines
      return calc_font_size
      
    end
      
  
  end
  

  def calc_font_size
    s = sum_of_lines
    #pry.binding
    font_size = 1
    lines = 0
    while ((font_size + 3) * lines) < 568
      w = width_of("w", size: font_size)
      chars_in_line = 560 / (w + 0.5 )
      lines = s / chars_in_line
      font_size += 1
    end
    return font_size
  end
    
  def text_content
    font_size = set_font_size
    w = width_of("w", size: font_size)
    chars_in_line = @width / (w)
    #pry.binding
     move_cursor_to 718
    @arr.each_with_index do |text, ind|
      bounding_box([10, cursor], :width => @width) do 
        text_box @post[text], size: font_size, character_spacing: 0, width: @width, at: [10, cursor]
      end
      line_in_text = @post[text].length/(chars_in_line )
      #pry.binding
      if line_in_text < 2
        t = 2
        move_down t * font_size 
        move_down 6
        #@pad = 46
        #move_down 10
      else 
        t = line_in_text
        move_down t * font_size 
        move_down 6
        
        #@pad = 6
      end
      #move_down t * font_size 
      #move_down @pad
    end
  end
  
  def create_background
    #ActionController::Base.helpers.asset_path("background.jpg")
    #
    image "#{Rails.root}/app/assets/images/background.jpg" , :at  => [0, @size[1]],
        :fit => @size
  end
  

    
  
end


