module Robot
  class LoginPage < Site
    URL = "https://target-sandbox.my.com/"

    def sign_in(login, password)
      click_sign_in

      user_field.set login
      password_field.set password

      sign_in_button.click

      MainPage.new(@browser)
      click_new_campaign
      choose_category
      site
      choose_product
      set_title
      set_text
      set_image1
    end

    def click_new_campaign
      @browser.a(text: 'Create campaign').wait_until_present.click
    end

    def choose_category
      puts "Start choose_category"
      @browser.span(text: 'Site').wait_until_present.click
      puts "= end_start_choose_category ="
    end

    def site
      puts "start site"
      @browser.text_field(class: 'input__inp').set 'https://sam.com'
    end

    def choose_product
      puts "start choose product"
      # @browser.span(text: 'Multi-format placement').wait_until_present.click
      @browser.div(:class => 'pac-item-icons__name js-pack-title', :data_value => '552').wait_until_present.click
      p "= end_choose_product ="
    end

    def set_title
      puts "start set title"
      @browser.text_field(class: 'input__inp', :data_gtm_id => 'banner_form_title').set 'Sam'
    end

    def set_text
      puts "start set text"
      @browser.textarea(class: 'textarea__elem', :data_gtm_id => 'banner_form_text').set "Sma sms"
    end

    def set_image1
      puts "set 1 image"
      # @browser.span(text: 'Upload 256 x 256').click.set("../images/image1.png")
      # @browser.file_field(:text => 'Upload 256 x 256')
    end

    def set_image2

    end

    def set_image3

    end

    private

    def click_sign_in
      @browser.goto URL
      @browser.span(class: 'ph-button__text_profilemenu_signin').wait_until_present.click
    end

    def user_field
      @browser.text_field(name: 'login')
    end

    def password_field
      @browser.text_field(name: 'password')
    end

    def sign_in_button
      @browser.button(class: 'button_submit')
    end
  end
end
