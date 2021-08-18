# frozen_string_literal: true

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test '#following?' do
    me = users(:me)
    alice = users(:alice)
    assert_not me.following?(alice)
    me.follow(alice)
    assert me.following?(alice)
  end

  test '#followed_by?' do
    me = users(:me)
    alice = users(:alice)
    assert_not me.followed_by?(alice)
    alice.follow(me)
    assert me.followed_by?(alice)
  end

  test '#follow' do
    me = users(:me)
    alice = users(:alice)

    assert_not me.following?(alice)
    me.follow(alice)
    assert me.following?(alice)
  end

  test '#unfollow' do
    me = users(:me)
    alice = users(:alice)
    me.follow(alice)
    assert me.following?(alice)
    me.unfollow(alice)
    assert_not me.following?(alice)
  end

  test '#name_or_email' do
    user = users(:alice)
    assert_equal 'alice@example.com', user.name_or_email
    user.name = 'Alice'
    assert_equal 'Alice', user.name_or_email
  end
end
