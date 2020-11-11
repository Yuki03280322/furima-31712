require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nickname,email,password,password_confirmation,first_name_kanji,last_name_kanji,first_name_kana,last_name_kana,date_of_birthが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it "nicknameが空だと登録できない" do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "passwordが空では登録できない" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "first_name_kanjiが空では登録できない" do
        @user.first_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it "last_name_kanjiが空では登録できない" do
        @user.last_name_kanji = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji can't be blank")
      end

      it "first_name_kanaが空では登録できない" do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "last_name_kanaが空では登録できない" do
        @user.last_name_kana = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end

      it "date_of_birthが空では登録できない" do
        @user.date_of_birth = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Date of birth can't be blank")
      end

      it "重複したemailは登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに@を含んでいなければ登録できない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが5文字以下では登録できない" do
        @user.password = "ab345"
        @user.password_confirmation = "ab345"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)", "Password is invalid")
      end

      it "passwordが半角英数字混合で入力されていない場合、登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password = "aaaa1111"
        @user.password_confirmation = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end

      it "passwordとpassword_confirmation,お互いの値が一致していない場合、登録できない" do
        @user.password = "abc123"
        @user.password_confirmation = "abc456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "first_name_kanjiに全角(漢字、ひらがな、カタカナ)以外を入力した場合、登録できない" do
        @user.first_name_kanji = "testてス十"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kanji 全角文字(漢字,ひらがな,カタカナ)を使用してください")
      end

      it "last_name_kanjiに全角(漢字、ひらがな、カタカナ)以外を入力した場合、登録できない" do
        @user.last_name_kanji = "TESTてス十"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kanji 全角文字(漢字,ひらがな,カタカナ)を使用してください")
      end

      it "first_name_kanaに全角カタカナ以外を入力した場合、登録できない" do
        @user.first_name_kana = "テストてすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana 全角カタカナを使用してください")
      end

      it "last_name_kanaに全角カタカナ以外を入力した場合、登録できない" do
        @user.last_name_kana = "テストてすと"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana 全角カタカナを使用してください")
      end

    end
  end
end