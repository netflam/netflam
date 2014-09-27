<p align="center">
  <img src="https://raw.githubusercontent.com/netflam/netflam/master/public/assets/images/shortcuts/16.png" alt="netflam" />
  <br />
  Netflam, your Hackerspace. <br /> Is's a community where people can discuss, share interesting links, questions and timely events.
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

#### More reading:

- [Installation](#installation): Step-by-step instructions for getting netflam running on your computer.
- [Usage](#usage): List of commands.
- [Dependencies](#dependencies): List of used dependencies.
- [Conceptions](#conceptions): List of ideas, to-do and tasks.
- [Contributing](#contributing): Explanation of how you can join the project.
- [License](#license): Clarification of certain rules.

## Installation

When an archive file of netflam is extracted, change the current working directory to the generated directory and perform installation.

Run the configuration script.

```bash
$ sudo rake install
```

Later, you have to change the settings in the file config/nginx.conf, be sure to turn off ssl. (default: localhost:443)

_Server works only in /home/netflam directory_

## Usage

This script is the primary interface for starting and stopping the netflam server.

### Install

To install all gems and create database.

```bash
$ sudo rake install
```

### Start

To start a daemonized (background) instance of netflam.

```bash
$ sudo rake start
```

### Stop

Stopping a background instance of netflam can be done from a shell prompt.

```bash
$ sudo rake stop
```

### Clean

Delete all files that not belong to the source code. (logs, dbs, pids, lock)

```bash
$ sudo rake clean
```

### Upgrade

Upgrades all scripts using the main repository developed by the community.

```bash
$ sudo rake upgrade
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
- [ ] API
- [ ] chrome/web widget (comments)
- [ ] search engine
- [ ] tags
- [ ] join using **twitter** or **github**
- [ ] help
- [ ] notifications
- [x] comments
- [x] pagination
- [x] about page
- [x] markdown with redcarpet and pygments
- [x] discussion/read story
- [x] user settings
- [x] user profile
- [x] meter using redis
- [x] join and login
- [x] handling story (new, edit, destroy)
- [x] popular and recent stories
- [x] terms and privacy

## Contributing

Please feel free to contribute to this project! Good code is delicious! Pull requests and feature requests welcome! :v:

<div align="center">
  <img src="https://pbs.twimg.com/media/BuTj9ULCAAEd4G7.jpg:large"/>
</div>

_IRC chatroom, **#netflam** on freenode.net_

## License

See LICENSE file in this repository.