Given /^I am a logged in member of staff$/ do
  @user = User.make!

  visit new_user_session_path
  fill_in 'Email',    with: @user.email
  fill_in 'Password', with: 'password'
  click_button 'Sign in'
end
