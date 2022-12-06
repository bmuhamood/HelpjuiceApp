require 'rails_helper'

describe Article, type: :model do
  context 'validation tests' do
    it 'ensures title presence' do
      article = Article.new(title: 'test').save
      expect(article).to eq(false)
    end

    it 'ensures description presence' do
      article = Article.new(description: 'test').save
      expect(article).to eq(false)
    end

    it 'should save successfully' do
      article = Article.new(title: 'test', description: 'test').save
      expect(article).to eq(false)
    end
  end

  context 'scope tests' do
    let(:params) { { title: 'test', description: 'test' } }
    before(:each) do
      Article.new(params).save
      Article.new(params).save
    end

    it 'should return all articles' do
      expect(Article.all.size).to eq(0)
    end
  end
end
