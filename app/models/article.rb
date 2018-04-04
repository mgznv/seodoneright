class Article < ActiveRecord::Base
  before_save :anti_spam
  extend FriendlyId
  friendly_id :title, use: :slugged

  validates_presence_of :title
  validates_presence_of :body

  def anti_spam
    doc = Nokogiri::HTML::DocumentFragment.parse(body)

    doc.css('a').each do |a|
      a[:rel] = 'nofollow'
      a[:target] = '_blank'
    end

    self.body = doc.to_s
  end
    
end
