# Dockerfile

# Fase 1: Build
FROM ruby:3.1.4-slim as build

WORKDIR /rails

# Instala dependências do sistema
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y build-essential git libpq-dev

# Copia e instala as gems
COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 4 --retry 3 && \
    rm -rf ~/.bundle/ "/usr/local/bundle"/ruby/*/cache

# Copia o resto do código e pré-compila os assets
COPY . .
RUN bundle exec rails assets:precompile

# Fase 2: Produção
FROM ruby:3.1.4-slim

WORKDIR /rails

# Instala apenas as dependências de produção
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y postgresql-client

# Copia as gems e o código da fase de build
COPY --from=build /usr/local/bundle /usr/local/bundle
COPY --from=build /rails /rails

# Expõe a porta e define o comando de início
EXPOSE 8080
CMD ["bundle", "exec", "rails", "s", "-p", "8080", "-b", "0.0.0.0"]
