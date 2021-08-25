require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
  @item = FactoryBot.build(:item)
end

context '商品登録ができる時' do
  it '全ての情報がある場合登録できる' do
    expect(@item).to be_valid
  end
end

context '商品登録ができない時' do
  it '画像が空では登録できない' do
    @item.image = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("Image can't be blank")
  end

  it '商品名が空では登録できない' do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Title can't be blank")
  end

  it '商品の説明が空では登録できない' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Text can't be blank")
  end

  it 'カテゴリーが空では登録できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Category can't be blank")
  end

  it '商品の状態が空では登録できない' do
    @item.detail_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Detail can't be blank")
  end

  it '配送料の負担が空では登録できない' do
    @item.delivery_price_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Delivery price can't be blank")
  end

  it '発送元の地域が空では登録できない' do
    @item.area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Area can't be blank")
  end

  it '発送までの日数が空では登録できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Day can't be blank")
  end

  it '価格が空では登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("Price can't be blank")
  end

  it 'ユーザーがログインしていないと登録できない' do
    @item.user_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("User can't be blank")

  end
end
end

