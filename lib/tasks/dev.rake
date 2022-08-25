namespace :dev do
  
  DEFAULT_PASSWORD = 123456 

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Apagando BD..."){%x(rails db:drop)}  
      show_spinner("Criando BD") {%x(rails db:create)}  
      show_spinner("Migrando BD") {%x(rails db:migrate)}
      show_spinner("Cadastrando o administrador e usuário padrão...") {%x(rails db:seed)}
      show_spinner("Cadastrando o administradores extras...") {%x(rails dev:add_extra_admins)}

    else 
      puts "Você não esta em ambiente de desenvolvimento"
    end
  end
  desc "Adiciona administradores extras"
  task add_extra_admins: :environment do
    10.times do |i|
      Admin.create!(
      email: Faker::Internet.email,
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
      )
    end
  end
  private
  def show_spinner(msg_start, msg_end= "Concluido!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin # Automatic animation with default interval
    yield 
    spinner.success("Concluido com sucesso!") # Stop animation
  end
end

 
