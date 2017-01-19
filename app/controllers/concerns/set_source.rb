module  SetSource
  extend ActiveSupport::Concern

  included do
    before_filter :set_source
  end

  def set_source
    session[:source] = params[:q] if params[:q]
  end

end



# before_action :set_source

#   def set_source
#     session[:source] = params[:q] if params[:q]
#   end