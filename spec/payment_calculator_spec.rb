# Babysitter Kata
#
# Background
# ----------
# This kata simulates a babysitter working and getting paid for one night.  The rules are pretty straight forward:
#
# The babysitter 
# - starts no earlier than 5:00PM
# - leaves no later than 4:00AM
# - gets paid $12/hour from start-time to bedtime
# - gets paid $8/hour from bedtime to midnight
# - gets paid $16/hour from midnight to end of job
# - gets paid for full hours (no fractional hours)
#
#
# Feature:
# As a babysitter
# In order to get paid for 1 night of work
# I want to calculate my nightly charge
require 'spec_helper'

# Parameters: Start time, Bed time, End time
describe 'PaymentCalculator' do

  subject { PaymentCalculator }

  context 'acceptance' do
    it 'should pay well for a dedicated babysitter who works the max time' do
      expect(subject.calculate_pay(5, 9, 4)).to eq 136
    end
  end

  context 'before bed' do
    it 'should pay at a rate of 12 per hour' do
      expect(subject.calculate_pay(5, 6, 6)).to eq 12
      expect(subject.calculate_pay(5, 9, 9)).to eq 48
    end
  end

  context 'between bed time and midnight' do
    it 'should pay at a rate of 8 per hour' do
      expect(subject.calculate_pay(5, 5, 6)).to eq 8
      expect(subject.calculate_pay(5, 5, 9)).to eq 32
    end
  end
end
