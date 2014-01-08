module FormattedErrors
  def redirect_to_path(path)
    respond_to do |format|
      format.js { render :js => "window.location.replace('#{path}');"}
    end
  end

  def format_error_messages(model)
    errors = model.errors.messages
    errors.keys.each {|k| errors["user_#{k}".gsub('.', '_attributes_')] = errors.delete(k).join(', ')}
    errors
  end
end
