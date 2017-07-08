module Robot
  class LoginPage < Site
    URL = "https://target-sandbox.my.com/"

    def sign_in(login, password)
      click_sign_in

      user_field.set login
      password_field.set password

      sign_in_button.click

      MainPage.new(@browser)
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
