atom_feed do |feed|
  feed.title( "Samuel Raines Official News" )

  latest_article = @articles.sort_by(&:updated_at).last
  feed.updated( latest_article && latest_article.updated_at )

  @articles.each do |article|
    feed.entry(article) do |entry|
      entry.title( article.content )
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.p( article.content )
        xhtml.span( "on #{article.timestamp}" )
      end
      entry.author { |author| author.name( "Samuel Raines" ) }
    end
  end
end
