![logo](https://raw.githubusercontent.com/kochd/electricsheep-hd-client/master/logo.png)
# electricsheep-hd-client
[Wikipedia](https://en.wikipedia.org/wiki/Electric_sheep):
`Electric Sheep is a distributed computing project for animating and evolving fractal flames, which are in turn distributed to the networked computers`

Originally designed by http://www.electricsheep.org/ but rendered at low resolutions i am trying to bring the sheeps to the next generation of computer displays.
This is the early alpha of a client for an electric sheep ecosystem which renders frames in HD ( e.g. 720p, 1080p, 4k, 8k).
For a good example of what electric sheeps are see [this youtube video](https://www.youtube.com/watch?v=KeNORUW4OGs)

## Road map
- System is fully operational but in an alpha state. So expect [bugs](https://github.com/kochd/electricsheep-hd-client/issues?utf8=%E2%9C%93&q=is%3Aissue+is%3Aopen+label%3Abug).
- ~~Currently there is no front end where you can see the overall rendering process by the community.~~
- ~~GPU rendering with CUDA is planned but this need more investigation~~ (Currently an experimental implementation exists)
- ~~Voting system for flames~~
- Handle replacement of bad flames when they are already rendered
- Submit system for new flames
- Non linear mutation paths

## IRC
Join us on [#electricsheephd @ freenode.net](http://webchat.freenode.net/?randomnick=1&channels=%23electricsheephd&prompt=0&uio=d4)
## Getting started
### Debian / Ubuntu / ...
<pre>
git clone https://github.com/kochd/electricsheep-hd-client.git && cd electricsheep-hd-client
apt-get install flam3 ruby bundler
bundle install
./daemon
</pre>

If this results in `./daemon.rb:29:in <main>': You will need an api key. Please register at https://sheeps.triple6.org:9999/register (RuntimeError)` continue with [registration](https://github.com/kochd/electricsheep-hd-client#registration).

### Other Linux / Unix / Posix systems
Currently i do not know. Adept from [Debian / Ubuntu](https://github.com/kochd/electricsheep-hd-client/blob/master/README.md#debian--ubuntu--) and contribute back so others can learn from your wisdom.

### Windows
Download an install the [latest release](https://github.com/kochd/electricsheep-hd-client/releases/latest) and follow the steps for your registration to get your apikey.

If you want the latest development version Install using the installer and replace every existing file in the installation folder with the content of the [latest master](https://github.com/kochd/electricsheep-hd-client/archive/master.zip). This usually isn't needed as we package a new installer whenever this should be the case.


## Registration
Register [here](https://sheeps.triple6.org/register) and follow the instructions in the email.
The certificated is self-signed. You should be fine ignoring the warning and process to the page.

## Usage
<pre>
Usage: daemon [OPTIONS]
        --server SERVER              Control server to connect to
        --apikey APIKEY              Your api key
        --debug                      Debug-mode
        --no-download                Do not download movies
        --nice NICENESS              Niceness (Higher values result in lower process priority (default: 19, max: 19))
</pre>

Once your daemon is rendering frames you will gain so called credits for every frame you have rendered. Your daemon will then start to "buy" completed sequences using your gained credits and download them to `$BASE_DIR/branches/$CURRENT_BRANCH/movies`. Currently you will only get short sequences of 5 seconds which can be played by the play script.

## Play
Just run
<pre>
./play
</pre>

This should read your earned movies of the current season and then play them using mpv (https://mpv.io). mpv is also available as apt package.

## Setups
Take a look at the README's in [setups](https://github.com/kochd/electricsheep-hd-client/tree/master/setups)
