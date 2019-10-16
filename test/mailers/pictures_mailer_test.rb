require 'test_helper'

class PicturesMailerTest < ActionMailer::TestCase
  test "name:string" do
    mail = PicturesMailer.name:string
    assert_equal "Name:string", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "email:string" do
    mail = PicturesMailer.email:string
    assert_equal "Email:string", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
