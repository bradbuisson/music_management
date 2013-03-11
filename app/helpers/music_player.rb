module MusicPlayer
  def player_for(song)
    song = song.downcase.gsub(/\s/, '_')
    case device
      when 'mp3'
        audio_tag "#{song}.mp3", controls: true
      when 'ogg'
        audio_tag "#{song}.ogg", controls: true
    end
  end

  def wrapper_for(player)
    content_tag(:div, player, id: 'player')
  end
end
