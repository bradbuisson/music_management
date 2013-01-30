module TimestampHelper
  def timestamp
    self.created_at.to_formatted_s(:long).gsub(/\d*:\d*/, '')
  end
end
