FROM ruby:2.7.1

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /generic_oauth_example
COPY Gemfile /generic_oauth_example/Gemfile
COPY Gemfile.lock /generic_oauth_example/Gemfile.lock
RUN bundle install
COPY . /generic_oauth_example

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["bash", "/usr/bin/entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]