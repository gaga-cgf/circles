require 'rails_helper'

RSpec.describe User, type: :model do
  # let(:user) { create(:user, password: 'adadeee', password_confirmation: 'adadeee') }

  describe 'validation' do
    subject { create(:user, password: '2222222', password_confirmation: '2222222') }

    it { is_expected.to validate_presence_of(:username) }
    it { is_expected.to validate_uniqueness_of(:username) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password) }

    it 'validate password' do
      expect do
        create(:user, password: ' ')
      end.to raise_error(
        ActiveRecord::RecordInvalid,
        /Password can't be blank, Password 密码长度最短为6位, Crypted password can't be blank, Password 密码不能为空/
      )
    end
  end
end
