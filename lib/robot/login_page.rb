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
      site.set 'https://sam.com'
      choose_product
      set_title.set 'Sam'
      set_text.set 'Sam sms'
    end

    def created

    end

    def click_new_campaign
      @browser.a(class: 'campaign-toolbar__create-button').wait_until_present.click
    end

    def choose_category
      puts "Start"
      @browser.div(class: 'accordion-select__item _external _active').click
      puts "End"
    end

    def site
      puts "start1"
      @browser.text_field(class: 'input__inp')
    end

    def choose_product
      puts "start2"
      @browser.span(class: 'pac-item-icons__name').wait_until_present.click
    end

    def set_title
      @browser.text_field(class: 'js-form-element')
    end

    def set_text
      @browser.text_field(class: 'textarea__elem')
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
