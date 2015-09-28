FROM ruby:2.2

RUN mkdir /app

ADD Gemfile /app/
ADD Gemfile.lock /app/
RUN cd /app && bundle install --deployment

ADD server /app/

RUN chown nobody /app/server
RUN chmod +x /app/server

ENV PORT 8787
EXPOSE $PORT

WORKDIR /app

USER nobody
CMD ["bundle", "exec", "./server"]

