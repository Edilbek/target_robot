require 'watir'

class Target
  TARGET_URL = 'https://target-sandbox.my.com/'

  def initialize(email, password)
    @browser = Watir::Browser.new :chrome
  end

  def login
    @browser.goto TARGET_URL
    puts @browser.span(class: 'welcome-block__buttons__btn welcome-block__buttons__btn_yellow js-try-btn').exists?
    @browser.text_field(name: 'login').set(email)
    @browser.text_field(name: 'password').set(password)
    @browser.button(class: 'button_submit').click
  end

  def close
    @browser.close
  end

end
target = Target.new("edil.talantbekov@gmail.com", 'parol123')
target.login
