class Link < ApplicationRecord

  before_create :generate_short_link
  before_create :sanitize

  ID_LENGTH = 8

  def short_link
    self.shorted_link = BITLY.shorten(self.initial_link)

  end

  def generate_short_link

    url = ([*('a'..'z'),*('0'..'9')]).sample(ID_LENGTH).join

    self.shorted_link = url
  end

  def find_duplicate
    Link.find_by_shorted_link(self.shorted_link)
  end

  def new_url?
    find_duplicate.nil?
  end

  def sanitize
    self.initial_link.strip!
    self.info = self.initial_link.downcase.gsub(/(https?:\/\/)|(www\.)/, "")
    self.info = "http://#{self.info}"
  end

end
