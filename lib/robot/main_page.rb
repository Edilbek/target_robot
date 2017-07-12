module Robot
  class MainPage < Site
    def logged_in?
      logged_in_element.exists?
    end

    def created
      created_element.exists?
    end
    
    private

    def logged_in_element
      @browser.div(class: "campaign-toolbar").wait_until_present
    end

    def created_element
      @browser.div(class: "info-panel__balance-status__notice").wait_until_present
    end
  end
end
