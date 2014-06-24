module ApplicationHelper
  def is_active?(page_name)
  "frontpage" if params[:action] == page_name
  end
end
