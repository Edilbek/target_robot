require 'watir'

class Robot
  URL = "https://target-sandbox.my.com/"

  def initialize(options = {})
    @browser = Watir::Browser.new
    
    @login = options[:login]
    @password = options[:password]
    @title = options[:title]
    @name = options[:name]
    @site = options[:site]
    @text = options[:text]
  end

  def close
    browser.close
  end

  def sign_in
    click_sign_in
    user_field
    password_field
    submit_sign_in
  end

  def create_campaign
    click_new_campaign
    choose_category
    set_site
    choose_product
    set_title
    set_text
    set_image1
    set_image2
    set_image3
    set_campaign_name
    submit_campaign
  end

  def click_sign_in
    @browser.goto URL
    @browser.span(class: 'ph-button__text_profilemenu_signin').wait_until_present.click
  end

  def user_field
    @browser.text_field(name: 'login').set(@login)
  end

  def password_field
    @browser.text_field(name: 'password').set(@password)
  end

  def submit_sign_in
    @browser.button(class: 'button_submit').click
  end

  def signed_in?
    signed_in_element.exists?
  end

  def signed_in_element
    @browser.div(class: "campaign-toolbar").wait_until_present
  end

  def click_new_campaign
    @browser.a(text: 'Create campaign').wait_until_present.click
  end

  def choose_category
    @browser.span(text: 'Site').wait_until_present.click
  end

  def set_site
    @browser.text_field(class: 'input__inp').set(@site)
  end

  def choose_product
    @browser.div(:class => 'pac-item-icons__name js-pack-title', :data_value => '552').wait_until_present.click
  end

  def set_title
    @browser.text_field(class: 'input__inp', :data_gtm_id => 'banner_form_title').set(@title)
  end

  def set_text
    @browser.textarea(class: 'textarea__elem', :data_gtm_id => 'banner_form_text').set(@text)
  end

  def set_image1
    attach_image('load_image_btn_256_256')
  end

  def set_image2
    attach_image('load_image_btn_1080_607')
  end

  def set_image3
    attach_image('load_image_btn_480_480')
  end

  def set_campaign_name
    @browser.text_field(class: 'create-page__campaign-name-input').set(@name)
  end

  def attach_image(id)
    @browser.file_field(data_gtm_id: id).set("#{__dir__}/lion.jpg")
    @browser.input(value: 'Save image').wait_until_present.click
  end

  def submit_campaign
    @browser.button(data_gtm_id: 'create_campaign_btn').wait_until_present.click
  end

  def created_campaign?
    @browser.a(text: @name).wait_until_present.exists?
  end
end
