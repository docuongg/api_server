FROM ruby:3.0.2

RUN apt-get update && apt-get install -y libvips libvips-dev libvips-tools

WORKDIR /app

COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock

RUN bundle install

COPY . /app

COPY wait-for-it.sh /usr/bin/
RUN chmod +x /usr/bin/wait-for-it.sh

# Copy entrypoint.sh script
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

# Start Rails server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
ENTRYPOINT ["/usr/bin/entrypoint.sh"]