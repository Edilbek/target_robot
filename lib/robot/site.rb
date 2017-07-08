module Robot
  class Site
    def initialize(browser)
      @browser = browser
    end

    def close
      @browser.close
    end
  end
end
