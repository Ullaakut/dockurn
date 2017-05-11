# ullaakut/dockurn
Simple docker image to make running turnserver easier without limits 

## Usage

Let's say you want to run coturn with all of its arguments but struggle because all docker images for coturn out there are huge and limit you to a few arguments.

You'd like to run something like `turnserver -L0.0.0.0 --no-stun -v -f -a -r yourrealm.net -u username:passwd`? Well it's your lucky day.

You just need `docker` and then simply run `docker run ullaakut/dockurn ./turnserver [your_arguments]`.

In our example from just before, it would be `docker run ullaakut/dockurn ./turnserver -L0.0.0.0 --no-stun -v -f -a -r yourrealm.net -u username:passwd`.
