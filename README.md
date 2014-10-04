<p align="center">
  <img src="https://raw.githubusercontent.com/netflam/netflam/master/public/assets/images/shortcuts/16.png" alt="netflam" />
  <br />
  Netflam, your Hackerspace. <br /> It's a community where people can discuss and share interesting links, questions and timely events.
  <br /><br />
  <a href="https://travis-ci.org/netflam/netflam"><img src="https://img.shields.io/travis/netflam/netflam.svg" /></a>
  <a href="https://github.com/netflam/netflam/releases"><img src="https://img.shields.io/github/release/netflam/netflam.svg" /></a>
  <a href="https://github.com/netflam/netflam/issues"><img src="https://img.shields.io/github/issues/netflam/netflam.svg" /></a>
  <a href="https://netflam.com/"><img src="https://img.shields.io/badge/url-netflam.com-brightgreen.svg" /></a>
</p>

---

<div align="center">
  <img src="https://dl.dropboxusercontent.com/u/103345209/Screenshots/Screenshot%202014-09-14%2018.22.57.png"/>
</div>

#### About

The atmosphere here is friendly and intellectual. We have a gender-balanced environment, and lightweight social rules.

We look for smart, friendly, self-directed, and intellectually curious people who enjoy programming and want to get dramatically better.

Ourselves we invent, create and develop this service/platform, tools and libraries, adapting to our own ideas.

People who contribute to [netflam's projects](https://github.com/netflam) will be added after a certain time to our [team](https://github.com/orgs/netflam/people).

Then you become a real netflammer, not only a user.

Together, we create a wonderful and open community!

#### Further reading:

- [Installation](#installation): Step-by-step instructions for getting netflam running on your computer.
- [Usage](#usage): List of commands.
- [Dependencies](#dependencies): List of used dependencies.
- [Conceptions](#conceptions): List of ideas, to-do and tasks.
- [Contributing](#contributing): Explanation of how you can join the project.
- [License](#license): Clarification of certain rules.

## Installation

When an archive file of netflam is extracted, change the current working directory to the generated directory and perform the installation.

Run the configuration script:

```bash
$ sudo rake install
```

Later, you have to change the settings in the file config/nginx.conf; be sure to turn off ssl (default: localhost:443).

_The server works only in the /home/netflam directory._

## Usage

This script is the primary interface for starting and stopping the netflam server.

### Install

To install all gems and create database:

```bash
$ sudo rake install
```

### Start

To start a daemonized (background) instance of netflam:

```bash
$ sudo rake start
```

### Stop

Stopping a background instance of netflam can be done from a shell prompt:

```bash
$ sudo rake stop
```

### Restart

Restarting the background instance of netflam can be done from a shell prompt too:

```bash
$ sudo rake restart
```

### Clean

Delete all files that do not belong to the source code (logs, dbs, pids, lock):

```bash
$ sudo rake clean
```

### Upgrade

Upgrades all scripts using the main repository developed by the community:

```bash
$ sudo rake upgrade
```

### Migrate (not implemented)

Migrate works the same way as install (complements differences):

```bash
$ sudo rake install
```

### Console

Start an IRB shell with the netflam environment loaded.

```bash
$ sudo rake console
```

### Quality

Run cane to check quality metrics.

```bash
$ sudo rake quality
```

## Dependencies

- Ruby (>= 1.9.0)
  * rake
  * unicorn
  * activerecord
  * redis
  * rack-protection
  * tilt
  * redcarpet
  * pygments
  * cane
- Javascript
  * jquery.js
  * sifter.js
  * selectize.js
- Nginx
- Sqlite3
- Redis

## Conceptions

- [ ] mobile version
- [ ] sync stories with **dropbox**
- [ ] list of projects and members at **github** (netflammers)
- [ ] API
- [ ] KaTeX for math
- [ ] better metatags (title, twitter, opengraph)
- [ ] chrome/web widget (comments)
- [ ] search engine
- [ ] tags
- [ ] join using **twitter** or **github**
- [ ] help
- [ ] user profile (with karma, comments)
- [ ] notifications (mention, comments)
- [x] comments
- [x] pagination
- [x] about page
- [x] markdown with redcarpet and pygments
- [x] discussion/read story
- [x] user settings
- [x] meter using redis
- [x] join and login
- [x] handling story (new, edit, destroy)
- [x] popular and recent stories
- [x] terms and privacy

## Contributing

Please feel free to contribute to this project! Remember, good code is delicious! Pull requests and feature requests welcome! :v:

<div align="center">
  <img src="https://pbs.twimg.com/media/BuTj9ULCAAEd4G7.jpg:large"/>
</div>

_IRC chatroom: **#netflam** on freenode.net_

## License

See LICENSE file in this repository.
