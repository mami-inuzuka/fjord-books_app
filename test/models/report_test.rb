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
    report.save
    assert_equal Date.today, report.created_on
  end
end
