module ApplicationHelper
  def full_title page_title = ""
    page_title.empty? ? "Photoshop Battles" : page_title
  end

  def dom_id_for object
    "##{object.class.to_s.downcase}_#{object.id}"
  end
end
