# syntax=docker/dockerfile:1

FROM ruby:3.2.2-slim as base

# Set environment to development
ENV RAILS_ENV=development

# Create and set the working directory
WORKDIR /app

# Install dependencies
RUN apt-get update -qq && apt-get install -y build-essential libsqlite3-dev

# Install application gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy application code
COPY . /app

# Expose port 3000
EXPOSE 3000

# Start the server
CMD ["rails", "server", "-b", "0.0.0.0"]
