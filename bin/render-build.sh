#!/usr/bin/env bash
# exit on error
set -o errexit

echo "Iniciando o build..."

# Instala as dependências do Ruby
bundle install

# Precompila os assets (CSS, JavaScript)
bundle exec rails assets:precompile

# Limpa assets antigos para economizar espaço
bundle exec rails assets:clean

# Roda as migrações do banco de dados
bundle exec rails db:migrate

bundle exec rails db:seed

echo "Build finalizado."