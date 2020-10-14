# 1-File Rails App

This project has been inspired by [Nate Berkopec's project](https://github.com/speedshop/rails-stripe-one-file) and [RiffRaff's suggestion](https://twitter.com/riffraff/status/1316241289059479553). 🎩🙇🏻‍♂️

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

This is a Rails app using a single file.

To use it, simply fork, modify what you need to, and deploy.

## Usage

```
$ SECRET_KEY_BASE=test ruby app.rb
```

## How Does It Work?

2. `app.rb` in this project defines a Rack application, that is, `TinyApp`. At the end of the file, we `Rack::Handler::Puma TinyApp`, because `run <rack-application` is how Rack defines what the application is and we explicitly use the Puma handler to do this.
3. Other than that, we basically just took all the different files generated from `rails new` and put them into a single file, then took out everything you don't absolutely need to run this app.

## How Can I Expand It?

Basically, look at `rails new` output and then add in what you need to. Generally you can add new files in here one at a time.

## Where can I learn more about mini Rails apps?

[Here](https://github.com/nateberkopec/rails_lightweight_stack) are a bunch of examples, including one that's the size of a Tweet, and [here](https://www.youtube.com/watch?v=SXV-RRsjsFc) is a conference talk about them.
