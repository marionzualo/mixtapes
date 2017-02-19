class Playlist < ActiveRecord::Base
  def self.ordered
    order(date: :desc)
  end

  def self.latest
    Playlist.ordered.limit(3)
  end
end
