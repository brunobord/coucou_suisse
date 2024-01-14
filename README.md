# Coucou Suisse

This is the source code for a Mastodon "Coucou Suisse". It's designed to ring each hour, like a [Cuckoo Clock](https://en.wikipedia.org/wiki/Cuckoo_clock).

This tool is distributed under the terms of the WTFPL. See the [LICENSE.txt](LICENSE.txt) file for more details.

## Requirements

* A Mastodon account,
* an active application linked to this account with the `write:statuses` permission,
* `crontab` (or a scheduler with the equivalent feature),
* `curl`


Once you've put the `coucou.sh` script in a dedicated location, you'll have to make sure that it's executable.

You'll then need to set at least 3 env variables:

* `TZ`: to set to the timezone you want (for example: "Europe/Zurich"),
* `MASTODON_HOST`: the instance your bot has been registered, 
* `ACCESS_TOKEN`: the value of the access token of your app.

### File example

```sh
export MASTODON_HOST=botsin.space
export ACCESS_TOKEN='lookatmybeautifulsecrettokenvalue'
export TZ=Europe/Zurich
```

(There's an example in this repository, adapt it to your needs)

I'd recommend to save those values in an environment file, and **make sure that your `ACCESS_TOKEN` is kept secret**.

## crontab setup

Using the `crontab -e` command, you'll access to your current accont Cron tab. In order to make sure to ring on the round hour, your cron line should look like this:

```crontab
0   *  *   *   *     BASH_ENV=/path/to/coucou_suisse/env.sh /path/to/coucou_suisse/coucou.sh
```

This means that the bot script will be executed every day, at each round hour.
