require 'rspec'
require_relative 'spec_helper'
require_relative '../day11/main'

describe Day11::Main do
  let(:input) { File.read('./day11/input.txt').strip }

  describe 'part 1' do
    let(:expected) { 'Enter your result here' }

    include_examples 'part1'
  end

  describe 'part 2' do
    let(:expected) { 'Enter your result here' }

    include_examples 'part2'
  end
end
