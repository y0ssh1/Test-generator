module QuestionsHelper
  def linebreak_to_br(text)
    return text if text.nil?
    h(text).gsub(/\r\n|\r|\n/, "<br>").html_safe
  end

  def count_match(a, b)
    [a, b].map(&:flatten).transpose.count do |pair|
      pair[0] == pair[1]
    end
  end
end
