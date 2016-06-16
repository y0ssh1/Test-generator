module QuestionsHelper
  def linebreak_to_br(text)
    return text if text.nil?
    h(text).gsub(/\r\n|\r|\n/, "<br>").html_safe
  end
end
