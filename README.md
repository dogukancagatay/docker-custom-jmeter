# Customized JMeter Container Image

CI/CD friendly custom JMeter container image.

Included plugins:

- [JMeter Plugins Manager](https://jmeter-plugins.org/wiki/PluginsManager/)
- [Custom JMeter Functions](https://jmeter-plugins.org/wiki/Functions/)

## Running

Build and run example test case `test.jmx`.

```sh
docker-compose up --build
```

## Further Plugin Customization

You can extend image by adding your plugins to `Dockerfile`.

## Credits

- Base JMeter container image is from [justb4/jmeter](https://hub.docker.com/r/justb4/jmeter) ([Github](https://github.com/justb4/docker-jmeter))
