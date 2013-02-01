atom_feed do |feed|
  feed.title( "Samuel Raines Official Music Blog" )

  latest_blog = @blogs.sort_by(&:updated_at).last
  feed.updated( latest_blog && latest_blog.updated_at )

  @blogs.each do |blog|
    feed.entry( blog ) do |entry|
      entry.title( blog.title )
      entry.summary :type => 'xhtml' do |xhtml|
        xhtml.span( "Posted on #{blog.timestamp}" )
        xhtml.p( strip_tags(blog.content) )
        xhtml.span( "Tagged with #{blog.tag_names}" )
      end
      entry.author { |author| author.name( "Samuel Raines" ) }
    end
  end
end
