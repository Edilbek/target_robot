# target_robot

Example:

{
  login: 'edil.talantbekov@gmail.com',
  password: 'parol123',
  title: "Selling my super car #{random}",
  name: "Super car honda #{random}",
  site: "http://honda-#{random}.com",
  text: 'Honda 2000y, color: red'
}

robot = Robot.new(options)
robot.sign_in
robot.create_campaign
