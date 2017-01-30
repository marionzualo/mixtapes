class PlaylistImporter
  def import
    playlists.each do |playlist|
      playlist.save! unless Playlist.where(uri: playlist.uri).any?
    end
  end

  private

  def playlists
    spotify_monthly_playlists.map do |spotify_playlist|
      Playlist.new(uri: spotify_playlist.uri, date: date(spotify_playlist), name: spotify_playlist.name)
    end
  end

  def date(spotify_playlist)
    date_str = "#{spotify_playlist.name}.01"
    Date.parse(date_str)
  end

  def spotify_monthly_playlists
    @spotify_monthly_playlists ||= begin
      authenticate
      user.playlists.find_all { |p| p.name =~ /^\d{4}\.\d{2}$/ }
    end
  end

  def authenticate
    RSpotify.authenticate(ENV['SPOTIFY_CLIENT_ID'], ENV['SPOTIFY_CLIENT_SECRET'])
  end

  def user
    mario_nzualo_id = '1166711686'
    RSpotify::User.find(mario_nzualo_id)
  end
end
