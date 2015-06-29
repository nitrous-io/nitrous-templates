## Meteor

### Sample application

A sample Meteor scaffold has been created for you in
`/home/nitrous/code/example`.  It is the equivalent to running the following:

```
cd ~/code
meteor create example
```

You can start the server by running `~/code/example/start-app` from the command
line.  Once it is running, you can use the preview menu to view the application
in a new tab.  Opening the `~/code/example/start-app` file is a good way of
finding out how to get your own Meteor application running.

Feel free to remove the `~/code/example` directory if you no longer need it.

### Preview

Note that you will need to listen to 0.0.0.0 when running the Meteor server in order to preview your app.  You can do this by running:

`meteor --port 0.0.0.0:3000`

The above command assumes you are previewing your app on port 3000, which is
the default preview port set up for this container.
