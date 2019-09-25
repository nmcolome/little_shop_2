require 'rails_helper'

RSpec.describe Item do
  describe 'relationships' do
    it { should belong_to :merchant }
    it { should have_many :reviews }
  end

  describe 'attributes' do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :description }
    it { is_expected.to respond_to :price }
    it { is_expected.to respond_to :image }
    it { is_expected.to respond_to :status }
    it { is_expected.to respond_to :inventory }
    it { is_expected.to respond_to :merchant_id }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :name }
    it { is_expected.to validate_presence_of :price }
    it { is_expected.to validate_presence_of :image }
    it { is_expected.to validate_presence_of :inventory }
  end
end
