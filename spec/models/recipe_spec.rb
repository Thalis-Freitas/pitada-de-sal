require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe '#valid?' do
    context 'presence' do
      it 'nome não pode ficar em branco' do
        recipe = Recipe.new(name: '')
        recipe.valid?
        expect(recipe.errors[:name]).to include 'não pode ficar em branco'
      end

      it 'tempo de preparo não pode ficar em branco' do
        recipe = Recipe.new(preparation_time: '')
        recipe.valid?
        expect(recipe.errors[:preparation_time]).to include 'não pode ficar em branco'
      end

      it 'porções não pode ficar em branco' do
        recipe = Recipe.new(portions: '')
        recipe.valid?
        expect(recipe.errors[:portions]).to include 'não pode ficar em branco'
      end

      it 'ingredientes não pode ficar em branco' do
        recipe = Recipe.new(ingredients: '')
        recipe.valid?
        expect(recipe.errors[:ingredients]).to include 'não pode ficar em branco'
      end

      it 'modo de preparo não pode ficar em branco' do
        recipe = Recipe.new(instructions: '')
        recipe.valid?
        expect(recipe.errors[:instructions]).to include 'não pode ficar em branco'
      end
    end

    context '#comparison' do
      it 'tempo de preparo deve ser maior do que 0' do
        recipe = Recipe.new(preparation_time: 0)
        recipe.valid?
        expect(recipe.errors[:preparation_time]).to include 'deve ser maior que 0'
      end

      it 'porções deve ser maior do que 0' do
        recipe = Recipe.new(portions: -5)
        recipe.valid?
        expect(recipe.errors[:portions]).to include 'deve ser maior que 0'
      end
    end
  end

  context '#set_post_date' do
    it 'deve definir a data de postagem' do
      sobremesas = Category.create!(name: 'sobremesas')
      recipe = Recipe.create!(name: 'Bolo de chocolate', preparation_time: 50, portions: 12,
                              ingredients: ['2 xícaras de farinha de trigo', '1 xícara de açúcar',
                                            '1 xícara de achocolatado', '1 colher (sobremesa) de fermento em pó',
                                            '1 pitada de sal', '2 ovos', '1 xícara de água morna',
                                            '1 xícara de óleo'], category: sobremesas,
                              instructions: ['Misture os ingredientes secos (exceto o fermento) em uma vasilha',
                                             'Na mesma, acrescente os ovos, a água morna e o óleo', 'Misture bem',
                                             'Unte a forma com margarina e polvilhe farinha de trigo',
                                             'Coloque a massa e ponha para assar em 250 graus por 40 minutos'],
                              hints: ['Peneirar os ingredientes na hora ajuda a deixar o bolo ainda mais fofinho!'])
      expect(recipe.post_date).to eq Time.zone.today
    end
  end
end
