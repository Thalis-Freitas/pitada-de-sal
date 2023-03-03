require 'rails_helper'

describe 'Usuário vê lista de receitas' do
  it 'na página inicial' do
    Recipe.create!(name: 'Bolo de chocolate', preparation_time: 50, portions: 12,
                   ingredients: ['2 xícaras de farinha de trigo', '1 xícara de açúcar',
                                 '1 xícara de achocolatado', '1 colher (sobremesa) de fermento em pó',
                                 '1 pitada de sal', '2 ovos', '1 xícara de água morna', '1 xícara de óleo'],
                   instructions: ['Misture os ingredientes secos (exceto o fermento) em uma vasilha',
                                  'Na mesma, acrescente os ovos, a água morna e o óleo', 'Misture bem',
                                  'Unte a forma com margarina e polvilhe farinha de trigo',
                                  'Coloque a massa e ponha para assar em 250 graus por 40 minutos'],
                   hints: ['Peneirar os ingredientes na hora ajuda com que o seu bolo fique ainda mais fofinho!'])
    Recipe.create!(name: 'Pão de arroz', preparation_time: 100, portions: 20,
                   ingredients: ['2 xícaras (chá) de arroz cozido', '1 xícara (chá) de açúcar',
                                 '2 ovos', '1 pacote de fermento biológico', '2 colheres (sopa) de queijo ralado',
                                 '1 pitada de sal', '2 colheres (sopa) de margarina ou manteiga',
                                 '2 xícaras (chá) de leite morno', '1 xícara (chá) de óleo',
                                 '4 xícaras (chá) de farinha de trigo sem fermento',
                                 '1 pacote de queijo ralado para polvilhar'],
                   instructions: ['Bata tudo no liquidificador (exceto a farinha de trigo)',
                                  'Adicione a farinha de trigo e bata novamente',
                                  'Despeje em uma fôrma untada e polvilhada e deixe descansar por 50 a 60 minutos',
                                  'Unte a forma com margarina e polvilhe farinha de trigo',
                                  'Coloque a massa e ponha para assar em 250 graus por 40 minutos',
                                  'Aqueça o forno por 10 minutos',
                                  'Coloque o pão no forno e aguarde de 30 a 40 minutos',
                                  'Pincele o pão com manteiga e jogue queijo ralado nele ainda quente'],
                   hints: ['Coloque o pão para descansar em um lugar sem muito barulho e que não tenha corrente de ar',
                           'Quando estiver assando, evite ficar abrindo o forno nos primeiros 30 minutos'])
    visit root_path

    expect(page).to have_content 'Bolo de chocolate'
    expect(page).to have_content '50 min'
    expect(page).to have_content '12 porções'
    expect(page).to have_content 'Pão de arroz'
    expect(page).to have_content '100 min'
    expect(page).to have_content '20 porções'
  end
end
