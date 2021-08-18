# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = me.reports.build(title: 'example', content: 'password')
    report.save
    assert report.editable?(me)
  end

  test '#created_on' do
    me = User.create!(email: 'me@example.com', password: 'password')
    report = me.reports.build(title: 'example', content: 'password')
    report.save
    assert_equal report.created_at.to_date, report.created_on
  end
end
