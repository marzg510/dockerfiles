FROM ruby:2.4.0

WORKDIR /app
COPY app.rb /app/app.rb
RUN mkdir /app/response

RUN gem install 'sinatra'
RUN gem install 'sinatra-contrib'

EXPOSE 80

CMD ["ruby", "app.rb", "-p", "80", "-o", "0.0.0.0"]
