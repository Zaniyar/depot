module ApplicationHelper
<<<<<<< HEAD
  
  def hidden_div_if(condition, attributes = {}, &block)
    if condition
      attributes["style"] = "display: none"
    end
    content_tag("div", attributes, &block)
  end
  
=======
>>>>>>> f74dafc0b303851eba233fb9d32a9e8da904b9ac
end
