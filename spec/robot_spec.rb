require_relative '../lib/robot'

RSpec.describe 'Robot' do
  let(:random) { rand(1000..9000) }
  let(:options) {
    {
      login: 'edil.talantbekov@gmail.com',
      password: 'parol123',
      title: "Selling my super car #{random}",
      name: "Super car honda #{random}",
      site: "http://honda-#{random}.com",
      text: 'Honda 2000y, color: red'
    }
  }
  let(:robot) { Robot.new(options) }

  it 'creates campaign' do
    robot.sign_in
    expect(robot).to be_signed_in

    robot.create_campaign
    expect(robot).to be_created_campaign
  end
end
