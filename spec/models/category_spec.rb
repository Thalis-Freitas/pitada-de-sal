require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'nome da categoria não pode ficar em branco' do
        category = Category.new(name: '')
        category.valid?
        expect(category.errors[:name]).to include 'não pode ficar em branco'
      end
    end

    context 'uniqueness' do
      it 'nome da categoria deve ser único' do
        Category.create!(name: 'Sobremesas')
        category = Category.new(name: 'Sobremesas')
        category.valid?
        expect(category.errors[:name]).to include 'já está em uso'
      end
    end
  end
end
