module TimestampHelper
  def timestamp
    timestamp = "Posted on #{self.created_at.to_formatted_s(:long).gsub(/\d*:\d*/, '')}"
    day = "#{timestamp.match(/\d{1}+/).to_s}".to_i.ordinalize
    month = timestamp.gsub(/[\d,]/, '')
    year = timestamp.match(/\d{4}/).to_s
    "#{month} #{day}, #{year}"
  end
end
