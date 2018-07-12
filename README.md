The web GUI depends on configuration setup in the `properties.js.`

The easiest way to have the web server reference a custom `properties.js` file is to run docker with a `-v` flag to mount a new `properties.js` in place of the old one.

Be sure to forward the application port `42424` back to the host.

Example run command)

`docker run --name web -p 42424:42424 -v /<path>/<to>/<my>/<file>:/home/osiris/dlt-web/properties.js -it -d miosiris/topology-gui`
