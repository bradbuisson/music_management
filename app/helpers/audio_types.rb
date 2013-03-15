module AudioTypes
  def user_agent
    @user_agent ||= begin
      request.env['HTTP_USER_AGENT'].downcase
    rescue
      ''
    end
  end

  def os
    @os ||= begin
      case user_agent
        when 'windows'
          "C:\/Documents"
        when 'linux'
          '~/'
      end
    end
  end

  def device_can_play?(format)
    case true
      when format == device
      when 'mp3' && %w{mac iphone ipad ipod msie chrome}.include?(device)
      when 'ogg' && %w{mozilla opera}.include?(device)
    end
  end
end
