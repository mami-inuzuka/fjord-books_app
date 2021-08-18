# frozen_string_literal: true

require 'test_helper'

class ReportTest < ActiveSupport::TestCase
  test '#editable?' do
    me = users(:me)
    report = me.reports.build(title: 'example', content: 'example')
    report.save
    assert report.editable?(me)
  end

  test '#created_on' do
    me = users(:me)
    report = me.reports.build(title: 'example', content: 'example')
    report.created_at = '2021-08-18 00:00:00'
    report.save
    assert_equal '2021/08/18', I18n.l(report.created_on)
  end
end
