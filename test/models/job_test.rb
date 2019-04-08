require 'test_helper'

class JobTest < ActiveSupport::TestCase
  test 'gap should return -No data- if women_count and men_count are nil' do
    job = jobs(:job_nil)
    assert_equal 'No data', job.gap
  end

  test 'gap should return -No staff- if women_count and men_count are equal to zero' do
    job = jobs(:job_zero)
    assert_equal 'No staff', job.gap
  end

  test 'gap should compute the right value' do
    job = jobs(:job_1)
    assert_equal 13, job.gap
  end

  test 'valid? should return false if gap is more than 15' do
    job = jobs(:job_2)
    assert_equal false, job.valid?
  end

  test 'valid? should return true if gap is less than or equal to 15' do
    job = jobs(:job_1)
    assert_equal true, job.valid?
  end

  test 'invalid? should return true if gap is more than 15' do
    job = jobs(:job_2)
    assert_equal false, job.valid?
  end

  test 'invalid? should return false if gap is less than or equal to 15' do
    job = jobs(:job_1)
    assert_equal true, job.valid?
  end

  test 'row_class should return -row-green- if job is valid' do
    job = jobs(:job_1)
    assert_equal 'row-green', job.row_class
  end

  test 'row_class should return -row-red- if job is invalid' do
    job = jobs(:job_2)
    assert_equal 'row-red', job.row_class
  end
end
