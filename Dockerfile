FROM elixir:1.8-alpine

EXPOSE 80

ENV MIX_ENV prod
ENV PORT 80

WORKDIR /src/
COPY . .

RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get && mix compile

ENTRYPOINT ["/src/docker-entrypoint.sh"]
CMD ["mix", "phx.server"]
