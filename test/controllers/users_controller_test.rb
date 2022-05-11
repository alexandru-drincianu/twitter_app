require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test 'users new' do
     get new_user_path
     assert_response :success
     assert_select 'label', 'Email'
     assert_select 'label', 'Password'
     assert_select 'label', 'Gender'
     assert_select 'label', 'Age'
  end

  test 'users create - invalid' do
    initial_user_count = User.count
    post users_path, params: {user: {name: 'George'} }
    assert_response :success
    # assert_select 'div', "Password can't be blank"
    assert_equal User.count, initial_user_count
  end

  test 'users create - valid' do
    initial_user_count = User.count
    post users_path, params: {user: {name: 'George', email: 'george@gmail.com', password: '123', gender: 'Male', age: 30, phone_number: '8731231'} }
    assert_response :redirect
    assert_equal User.count, initial_user_count + 1
    user = User.last
    assert_equal user.name, 'George'
  end

  test 'users index' do
    #user = User.create!(email:"alexdrincianu@gmail.com", password: "123", name: "Alex", gender: "Male", age: 21, phone_number: "12312321")
    #post login_path, params: {email:user.email, password:user.password} 
    #assert_response :redirect
    #get users_path
    #assert_response :success
    get users_path
    assert_response :redirect
 end
end
