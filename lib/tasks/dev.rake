namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    puts "Resetando o banco de dados..."

    # %x(rails db:drop db:create db:migrate)

    puts "Cadastrando os tipos de contato..."

    kinds = %w(Amigo Comercial Conhecido)

    kinds.each do |kind|
      Kind.create!(
        description: kind
      )
    end

    puts "Tipos Contato cadastrados com sucesso!"

    ######################

    puts "Cadastrando os contatos..."

    100.times do |i|
      Contact.create!(
        name: Faker::Name.name,
        email: Faker::Internet.email,
        birthdate: Faker::Date.birthday(min_age: 18, max_age: 65),
        kind: Kind.all.sample
      )
    end

    puts "Contatos cadastrados com sucesso!"

   end
end