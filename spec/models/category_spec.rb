require 'rails_helper'

RSpec.describe Category, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'nome não pode ficar em branco' do
        category = Category.new(name: '')
        category.valid?
        expect(category.errors[:name]).to include 'não pode ficar em branco'
      end
    end
  end
end
