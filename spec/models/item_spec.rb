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
    @item.images = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("画像を入力してください")
  end

  it '商品名が空では登録できない' do
    @item.title = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("商品名を入力してください")
  end

  it '商品の説明が空では登録できない' do
    @item.text = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("商品の説明を入力してください")
  end

  it 'カテゴリーが空では登録できない' do
    @item.category_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("カテゴリーを入力してください")
  end

  it '商品の状態が空では登録できない' do
    @item.detail_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("商品の状態を入力してください")
  end

  it '配送料の負担が空では登録できない' do
    @item.delivery_price_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("配送料の負担を入力してください")
  end

  it '発送元の地域が空では登録できない' do
    @item.area_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("発送元の地域を入力してください")
  end

  it '発送までの日数が空では登録できない' do
    @item.day_id = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("発送までの日数を入力してください")
  end

  it '価格が空では登録できない' do
    @item.price = ''
    @item.valid?
    expect(@item.errors.full_messages).to include ("価格を入力してください")
  end

  it 'ユーザーがログインしていないと登録できない' do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include ("Userを入力してください")
  end

  it 'カテゴリーが未選択だと出品できない' do
    @item.category_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
  end

  it '商品の状態が未選択だと出品できない' do
    @item.detail_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
  end

  it '配送料の負担が未選択だと出品できない' do
    @item.delivery_price_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
  end

  it '発送元の地域が未選択だと出品できない' do
    @item.area_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
  end

  it '発送までの日数が未選択だと出品できない' do
    @item.day_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
  end

  it '価格が全角数字だと出品できない' do
    @item.price = "３００"
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は数値で入力してください")
end

  it '価格が半角英数混合だと出品できない' do
    @item.price = "e3e3e3e3"
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は数値で入力してください")
  end
  

  it '価格が半角英語のみでは出品できない' do
    @item.price = "wwwwww"
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は数値で入力してください")
  end

  
  it '価格が300円未満では出品できない' do
    @item.price = "10"
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
  end

  it '価格が9_999_999円を超えると出品できない' do
    @item.price = "10000000"
    @item.valid?
    expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
  end
end
end

