module AudioTypes
  def user_agent
    @user_agent ||= begin
      request.env['HTTP_USER_AGENT'].downcase
    rescue
      ''
    end
  end

  def device
    @device ||= begin
      case user_agent
        when %r{(mac|ipad|iphone|ipod|chrome|msie)}
          'mp3'
        when %r{(mozilla|opera)}
          'ogg'
      end
    end
  end

  def device_can_play?(audio_type)
    case true
      when audio_type == device
      when 'mp3' && %w{mac iphone ipad ipod msie chrome}.include?(device)
      when 'ogg' && %w{mozilla opera}.include?(device)
    end
  end
end
