module TrackLogger
  def add_track(options = {})
    author= options[:author]
    reader = options[:reader]
    item = options[:item]
    #判断条件，不是自己访问，并且没有出现在列表中过
    if reader !=author && (!item.tracks.map(&:user_id).include? reader.id)
      Track.create!(:item => options[:item], :user =>reader )
    end
   end
end