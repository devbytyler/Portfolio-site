module DefaultPageContent
  extend ActiveSupport::Concern

  included do
  before_filter :set_page_defaults
  end
   
  def set_page_defaults
    @page_title = "Tyler Stephens | Portfolio Website"
    @seo_keywords = "Tyler Stephens Portfolio"
  end
end



  