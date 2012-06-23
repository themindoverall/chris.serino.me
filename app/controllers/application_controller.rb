class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :initialize_nav


  protected
  def nav_name
  	controller_name.to_sym
  end

  def check_password(pass)
    pass == ENV['SERINOME_PASSWORD']
  end

  private
  def initialize_nav
  	@nav = {
  		blog: {title: 'blog', path: blog_path, current: false},
  		work: {title: 'work', path: work_path, current: false},
  		bio: {title: 'bio', path: bio_path, current: false},
  		contact: {title: 'contact', path: contact_path, current: false}
  	}
  	@nav[nav_name][:current] = true
  end
end
