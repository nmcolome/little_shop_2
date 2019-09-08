require 'rails_helper'

RSpec.describe Review do
  describe 'attributes' do
    it { is_expected.to respond_to :title }
    it { is_expected.to respond_to :content }
    it { is_expected.to respond_to :rating }
  end

  describe 'relationships' do
    it { should belong_to :item}
  end
end
