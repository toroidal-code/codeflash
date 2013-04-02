require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = User.create(email: "lol@lol.lol",
                    username: "LOLOLOLOLOL",
                    password: "LOLlol101",
                    admin: true)
  end

  test 'should not be valid missing email' do
    user = User.new(username: "codeflash",
                    password: @user.password,
                    admin: true)
    assert !user.valid?
  end

  test 'should not be valid missing username' do
    user = User.new(email: "codeflash@codeflash.io",
                    password: @user.password,
                    admin: true)
    assert !user.valid?
  end

  test 'should not be missing password' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "codeflash",
                    admin: true)
    assert !user.valid?
  end

  test 'should not be valid invalid password' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "codeflash",
                    password: "slalaldkfngkwcomfasdf",
                    admin: true)
    assert !user.valid?
  end

  test 'should not be valid invalid too short' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "codeflash",
                    password: "Dsdf18",
                    admin: true)
    assert !user.valid?
  end

  test 'should not be valid invalid username' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "1codeflash",
                    password: @user.password,
                    admin: true)
    assert !user.valid?
  end

  test 'should not be valid too short username' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "1codeflash",
                    password: @user.password,
                    admin: true)
    assert !user.valid?
  end

  test 'should be valid' do
    user = User.new(email: "codeflash@codeflash.io",
                    username: "codeflash",
                    password: @user.password,
                    admin: true)
    assert user.valid?
  end
end
