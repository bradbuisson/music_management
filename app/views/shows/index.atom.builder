atom_feed do |feed|
  feed.title( "Samuel Raines Official Music Show Times" )

  latest_show = @shows.sort_by(&:updated_at).last
  feed.updated( latest_show && latest_show.updated_at )

  @shows.each do |show|
    feed.entry( show ) do |entry|
      entry.title( "#{show.venue} on #{show.date} at #{show.time}" )
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.table do
          xhtml.tr do
            xhtml.th( "Date" )
            xhtml.th( "Time" )
            xhtml.th( "Venue" )
            xhtml.th( "Address" )
            xhtml.th( "Price" )
          end
          xhtml.tr do
            xhtml.td( show.date )
            xhtml.td( show.time )
            xhtml.td( show.venue )
            xhtml.td( show.address )
            xhtml.td( show.price_for_show )
          end
        end
      end
      entry.author { |author| author.name( "Samuel Raines" ) }
    end
  end
end
