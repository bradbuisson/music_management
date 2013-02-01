atom_feed do |feed|
  feed.title( "Samuel Raines Official Music Show Times" )

  latest_show = @shows.sort_by(&:updated_at).last
  feed.updated( latest_show && latest_show.updated_at )

  @shows.each do |show|
    feed.entry( show ) do |entry|
      entry.title( "#{show.venue} on #{show.date} at #{show.time}" )
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.p( strip_tags(show.address) )
        xhtml.span( "Price: #{show.price_for_show}" )
      end
      entry.author { |author| author.name( "Samuel Raines" ) }
    end
  end
end
