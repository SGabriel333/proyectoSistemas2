require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "password_reset" do
    mail = UserMailer.password_reset
    assert_equal "Password reset", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["proy.sistema@gmail.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
