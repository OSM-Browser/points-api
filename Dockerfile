FROM elixir:1.5-slim

ENV MIX_ENV prod

WORKDIR /usr/src/points-api
COPY . .

RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get && mix compile

CMD ["mix", "phx.server"]
