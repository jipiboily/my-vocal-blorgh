# My Vocal Blorgh: a demo app using Vocal blog engine.

This is a simple demo Rails app using [Vocal](https://github.com/jipiboily/vocal), the magnificent blog engine.

## Setup

**IMPORTANT**: this is a demo app, you should instead create your own app to use it in production. That said, it's the easiest way to try Vocal.

### Heroku

Deploy on Heroku...I'll add a "Deploy to Heroku" button some day, but until then:
- `git clone git@github.com:jipiboily/my-vocal-blorgh.git`
- `heroku create`
- `git push heroku master`
- :boom:

### Docker

There is a basic and far from perfect Dockerfile at the root of the project, so you can just:
- `git clone git@github.com:jipiboily/my-vocal-blorgh.git`
- `docker build .`
- `docker run -d -p 3000:3000 -e DATABASE_URL=postgres://USERNAME:PASSWORD@SOME_IP:5432/DATABASE_NAME IMAGE_ID`
- :boom:
