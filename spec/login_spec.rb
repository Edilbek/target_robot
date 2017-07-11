require_relative '../lib/robot'

RSpec.describe 'Target' do
  let(:browser) { Watir::Browser.new }
  let(:site) { Robot::Site.new(browser) }
  let(:login_page) { Robot::LoginPage.new(browser) }
  let(:campaign_page) { Robot::NewCampaignPage.new(browser) }

  it 'signs in' do
    main_page = login_page.sign_in('edil.talantbekov@gmail.com', 'parol123')
    expect(main_page).to be_logged_in
  end

  it 'creates campaign' do
    login_page.click_new_campaign
    login_page.choose_category
    login_page.site
    login_page.choose_product
  end
end
