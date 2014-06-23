class Article < ActiveRecord::Base
  attr_accessible :title, :body, :released_at, :expired_at, :member_only, :no_expiration
  attr_accessor :no_expiration
  before_validation :clear_expired_at
  validates :title, :body, :released_at, presence: true
  validates :title, length: {maximum: 200}


  class << self 
  def sidebar_article(num=5, current_user)
    if current_user
      rel = Article.order("released_at DESC").limit(num)
    else
      rel = Article.where(member_only: false).order("released_at DESC").limit(num)
    end 
  end 
  end 

  def no_expiration=(val)
    @no_expiration = val.in?([true, 1, "1"])
  end 


  private
  def clear_expired_at
  	self.expired_at = nil if @no_expiration
  end 


  def check_expired_at
  	if expired_at && expired_at < releasde_at
  		errors.add(:expired_at, :expired_at_too_old)
  	end 
  end 




end
