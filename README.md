# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


# API

## Obtendo um curso

```
GET 'api/v1/courses'
```

resposta:

```json
[
  {
    id: 10,
    name: 'Ruby on Rails'
  }
]
```