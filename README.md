<p align="center">
  <a href="https://github.com/netflam/netflam">
    <img src="https://raw.githubusercontent.com/netflam/netflam/master/public/assets/images/shortcuts/16.png" alt="netflam" />
  </a>
  <br />
  Netflam, your Hackerspace. <br /> Is's a community where people can discuss, share interesting links, questions and timely events.
  <br /><br />
  <a href="https://travis-ci.org/netflam/netflam"><img src="http://img.shields.io/travis/netflam/netflam.svg" /></a>
  <a href="https://github.com/netflam/netflam/releases"><img src="http://img.shields.io/github/release/netflam/netflam.svg" /></a>
  <a href="https://github.com/netflam/netflam/issues"><img src="http://img.shields.io/github/issues/netflam/netflam.svg" /></a>
</p>

---

<div align="center">
  <img src="https://dl.dropboxusercontent.com/u/103345209/Screenshots/Screenshot%202014-09-14%2018.22.57.png"/>
</div>

#### More reading:

- [Installation](#installation): Step-by-step instructions for getting netflam running on your computer.
- [Usage](#usage): List of commands.
- [Dependencies](#dependencies): List of used dependencies.
- [Contributing](#contributing): Explanation of how you can join the project.
- [License](#license): Clarification of certain rules.

## Installation

When an archive file of netflam is extracted, change the current working directory to the generated directory and perform installation.

Run the configuration script.

```bash
$ sudo rake install
```

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

### Update

Updates all scripts using the main repository developed by the community.

```bash
$ sudo rake update
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
- Javascript
  * jquery.js
  * sifter.js
  * selectize.js
- Nginx
- Sqlite3
- Redis

## Contributing

Please feel free to contribute to this project! Pull requests and feature requests welcome! :v:

_IRC chatroom, **#netflam** on freenode.net_

## License

See LICENSE file in this repository.