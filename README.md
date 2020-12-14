# Basic Example OAuth2.0
### Purpose
Project example to get a simple approach to a generic authentication OAuth 2.0 standard to platforms.  I focus on web flow to authenticate, and the platforms for this example are Google and Github.
If you wanted to know the standar, check the following links:
- [Github OAuth](https://docs.github.com/en/free-pro-team@latest/developers/apps/authorizing-oauth-apps).
- [Google OAuth](https://developers.google.com/identity/protocols/oauth2/web-server#example).

In a future I'll update the logic flow of the authentication

## Local Environment

### Requirements

- [Docker Desktop](https://docs.docker.com/desktop/). Tested on windows10.
- Docker Compose [basic commands knowledge](https://docs.docker.com/compose/). Docker Compose is included in Docker Desktop.
- Rails basic knowledge
- httparty gem knowledge

### Build
Change `.envexample` file to `.env` and add your own credentials
```sh
docker-compose build
docker-compose run web rails db:create
docker-compose run web rails db:migrate
docker-compose up
```
### Test
```sh
docker-compose run web rspec spec
```

I'm a Junior Developer, so be kind ... I'm open for suggestions.