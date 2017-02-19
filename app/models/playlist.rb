class Playlist < ActiveRecord::Base
  def self.latest
    Playlist.order(date: :desc).limit(3)
  end
end
