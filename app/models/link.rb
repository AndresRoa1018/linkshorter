class Link < ApplicationRecord

  def short_link
    self.shorted_link = BITLY.shorten(self.initial_link)
  end
end
