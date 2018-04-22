# THIS PROJECT WAS JUST CREATED FOR EDUATIONAL PURPOSES
# Elixir Phoenix framework

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:8080`](http://localhost:8080) from your browser.

# TT8L-Gatekeeper

The TT8L-gatekeeper is a simple REST-based authentification service which issues JWTs on successful logins.

## Sign up
It supports signing up via
`POST /api/v1/sign_up`
with payload
```json
{
  "user": {
    "email": "p.jackson@mordor.com",
    "name": "Peter Jackson",
    "password": "Peter123"
  }
}
```

A successful signup should respond with
```json
{
  "status": "ok",
  "message": "Now you can sign in using your email and password at /api/v1/sign_in. You will receive JWT token.
              Please put this token into Authorization header for all authorized requests."
}
```

## Sign in
Login is supported via
`POST /api/v1/sign_in`
with payload
```json
{
  "session": {
    "email": "p.jackson@mordor.com",
    "password": "Peter123"
  }
}
```
A successful signin should respond with a JWT, like in
```json
{
  "status": "ok",
  "message": "You are successfully logged in! Add this token to authorization header to make authorized requests.",
  "data": {
    "token":"eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJVc2VyOmQ3MTE4OGU5LTA2YzItNDY4My1hMjg4LWQyYWFkNGQ3ZWNjYSIsImV4cCI6MTUyNjk5MzA2NywiaWF0IjoxNTI0NDAxMDY3LCJpc3MiOiJUdDhsR2F0ZWtlZXBlciIsImp0aSI6IjY0ODJlNDVlLTViMWItNGU4Ny1iOTg2LTdjZTI1NGUzZmUwZSIsInBlbSI6e30sInN1YiI6IlVzZXI6ZDcxMTg4ZTktMDZjMi00NjgzLWEyODgtZDJhYWQ0ZDdlY2NhIiwidHlwIjoiYXBpIn0.JeuAVcG8LLLmzplhHmqtVNNWsQ_qtH3LsBwAS1KazdYBqOyeHO6TshM6OjX9WV-gRHkCnKsbKSMPfqvPtk9FpA",
    "email":"p.jackson@mordor.com"}
}
```
