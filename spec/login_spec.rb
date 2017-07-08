require_relative '../lib/robot'

RSpec.describe 'Target' do
  let(:browser) { Watir::Browser.new }
  let(:site) { Robot::Site.new(browser) }
  let(:login_page) { Robot::LoginPage.new(browser) }

  it 'signs in' do
    main_page = login_page.sign_in('edil.talantbekov@gmail.com', 'parol123')
    expect(main_page).to be_logged_in
  end

  it 'creates campaign' do
    main_page = login_page.sign_in('edil.talantbekov@gmail.com', 'parol123')
    expect(main_page).to be_logged_in

    
    expect(campaign).to be_created
  end
end
