module ApplicationHelper
  def full_title page_title = ""
    page_title.empty? ? "Photoshop Battles" : page_title
  end
end
