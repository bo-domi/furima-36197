require 'rails_helper'

RSpec.describe RecordAddress, type: :model do
  before do
    @record_address = FactoryBot.build(:record_address)
end

  context '購入ができる時' do
    it '全ての情報がある場合購入できる' do
      expect(@record_address).to be_valid
    end
  end

  context '購入ができない時' do
    it 'postal_codeが空では購入できない' do
      @record_address.postal_code = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("Postal code can't be blank")
    end

    it 'area_idが空では購入できない' do
      @record_address.area_id = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("Area can't be blank")
    end

    it 'municipalityが空では購入できない' do
      @record_address.municipality = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("Municipality can't be blank")
    end

    it 'house_numberが空では購入できない' do
      @record_address.house_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("House number can't be blank")
    end

    it 'telephone_numberが空では購入できない' do
      @record_address.telephone_number = ''
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("Telephone number can't be blank")
    end

    it 'telephone_numberが10桁以下であれば購入できない' do
      @record_address.telephone_number = '111'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'telephone_numberが11桁以上であれば購入できない' do
      @record_address.telephone_number = '111111111111'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Telephone number is invalid")
    end

    it 'postal_codeが3桁ハイフン4桁以外では購入できない' do
      @record_address.postal_code = '333344'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include ("Postal code is invalid. Include hyphen(-)")
    end

    it 'postal_codeが全角数字だと購入できない' do
      @record_address.postal_code = '１１１−１１１１'
      @record_address.valid?
      expect(@record_address.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
  end

     it 'tokenが空では購入できない' do
      @record_address.token = ''
      @record_address.valid?
    expect(@record_address.errors.full_messages).to include ("Token can't be blank")
  end
end
end