## Setting up the project

To make the process of start working in the project easier I've followed a hybrid docker-compose approach.

This approach will only dockerize the dependencies of the project, like postgresql and redis.

First of all you will need to have docker and docker-compose installed on your machine. If you don't have it, you can follow the normal way(Installing postgresql and redis). 

```bash
> docker-compose up -d db redis
```
It will start both of the containers. 

## Environment variables
In the project's root folder there is a `.env.example` file. Just copy this file:

```
> cp -R .env.example .env
```

inside of the .env file you will find two variables, `SECRET_TOKEN` and `NGROK_URL`. Both are neccessary to make the integration with Github webhooks work out.

### Generating the secret token
On your webhooks setting's page you will a field to add the secret token. To generate it you can use the ruby command below:

```bash
> ruby -rsecurerandom -e 'puts SecureRandom.hex(20)'
```
Add the code on your webhooks setting's page and on your .env file.

```
SECRET_TOKEN=code_generated_by_the_command_above
NGROK_URL=the_ngrok_url_you_have_created
```

### Ngrok

To test your webhook you will need to download and configure ngrok. After start it, get the url and add in the  payload URL on webhook setting's page:

```
<<ngrok_url>>/issues/events
```
