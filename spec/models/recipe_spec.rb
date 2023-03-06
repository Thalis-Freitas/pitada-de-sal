require 'rails_helper'

RSpec.describe Recipe, type: :model do
  context '#set_post_date' do
    it 'deve definir a data de postagem' do
      recipe = Recipe.create!(name: 'Bolo de chocolate', preparation_time: 50, portions: 12,
                              ingredients: ['2 xícaras de farinha de trigo', '1 xícara de açúcar',
                                            '1 xícara de achocolatado', '1 colher (sobremesa) de fermento em pó',
                                            '1 pitada de sal', '2 ovos', '1 xícara de água morna',
                                            '1 xícara de óleo'],
                              instructions: ['Misture os ingredientes secos (exceto o fermento) em uma vasilha',
                                             'Na mesma, acrescente os ovos, a água morna e o óleo', 'Misture bem',
                                             'Unte a forma com margarina e polvilhe farinha de trigo',
                                             'Coloque a massa e ponha para assar em 250 graus por 40 minutos'],
                              hints: ['Peneirar os ingredientes na hora ajuda a deixar o bolo ainda mais fofinho!'])
      expect(recipe.post_date).to eq Time.zone.today
    end
  end
end
