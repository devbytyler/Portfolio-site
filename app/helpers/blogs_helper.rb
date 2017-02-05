module BlogsHelper
  def gravatar_helper user
     image_tag "https://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(user.email)}?d=retro", width: 60
  end

  def action_icon_helper(action)
    case action
    when "draft" then '<i class="fa fa-eye-slash" aria-hidden="true"></i>'.html_safe
    when "published" then '<i class="fa fa-eye" aria-hidden="true"></i>'.html_safe
    when "edit" then '<i class="fa fa-pencil-square-o" aria-hidden="true"></i>'.html_safe
    when "delete" then '<i class="fa fa-trash-o" aria-hidden="true"></i>'.html_safe
    when "back" then '<i class="fa fa-undo" aria-hidden="true"></i>'.html_safe
    else action
    end
  end

  class CodeRayify < Redcarpet::Render::HTML
   def block_code(code, language)
     CodeRay.scan(code,language).div
   end
 end

 def markdown(text)
   coderayified = CodeRayify.new(filter_html: true, hard_wrap: true)

   options = {
     fenced_code_blocks: true,
     no_intra_emphasis: true,
     autolink: true,
     lax_html_blocks: true,
   }

   markdown_to_html = Redcarpet::Markdown.new(coderayified, options)
   markdown_to_html.render(text).html_safe
 end

end
