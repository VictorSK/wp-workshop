# Seamlessly manage your WordPress site development with WP Workshop

WP Workshop is a collection of utilities I use to make local WordPress theme development, deployment, and maintenance easier, leveraging the power of Docker for container virtualization, and Ruby Gems for Sass/SCSS compiling. Crafted to be simple, straightforward, and easy to customize.

Please use [GitHub Issues](https://github.com/VictorSK/wp-workshop/issues) to report bugs.

## Requirements

WP Workshop **requires docker**. If you do not have docker, [download docker](https://www.docker.com/products/docker-desktop) and install it on your local machine.

WP Workshop **requires Ruby only if** you want to use the `bin/sass` utility which utilizes Sass and Bootstrap Ruby Gems to compile Bootstap and custom SCSS.

## Project Organization

This is what each root project item is for:

- bin/ – Command line scripts are in this directory.
- config/ - Files required for configuration are in this directory.
- data/ – Database dump files go in this directory.
- wp-content/ – The WordPress application files are in this directory and mounted into the Docker container.
- docker-compose.yml – Docker Compose file.
- Gemfile - Ruby Gem file.
- README.md – Every project needs a README file. PLEASE READ IT!

## Configure

I tried to keep the configuration simple and centralized to a few files. **You must** review these configuration files and customize with settings for your specific configuration.

- Configure your project settings in `config/config.rb`. This is the main configuration file and all the utilities used in WP Workshop leverage these settings.
- Configure the WordPress version in `config\Dockerfile-wp`. This is the WordPress version that will be installed to your Docker container and should be the latest WordPress version if starting a new WordPress project, or match the WordPress version of your existing project needs.
- Configure Docker container default settings in `docker-compose.yml`. This is the Docker Compose build file and should be customize for your specific needs if needed. Most WordPress sites only need a Web and DB container.

## Docker

Before starting Docker containers, **you must configure** the `config\Dockerfile-wp` and `docker-compose.yml` configuration files per project specifications.

Helpful References:

- <https://docs.docker.com/compose/compose-file/>
- <https://docs.docker.com/compose/reference/>

### Start Docker

This command will run docker-compose in the foreground, use the `-d` flag to run it as a background process.

```bash
docker compose up
```

### Stop Docker

```bash
docker compose stop
```

If Docker is running in the foreground, press `ctl+c` in the active terminal window to stop Docker.

### Stop Docker and Delete the Current Environment Data

Stops and removes containers, networks, volumes, and images created by up. Use the `-v` flag to remove named volumes declared in the `volumes` section of the Compose file and anonymous volumes attached to containers.

```bash
docker compose down
```

## Utilities

Before you use these utilities, **you must setup** the `config/config.rb` configuration file per project specifications.

All utilities have a simulate flag (`-s`) to simulate the command to be executed and output the exact command to your terminal window **without** running the command. This is ideal to verify the command and allows you to check for configuration issues before you run it.

### Fetching Remote Content

**WARNING:** This will overwrite local content for this project. Before moving forward with fetching content from remote server **REMEMBER TO BACKUP YOUR LOCAL FILES** for this project. Safety first!

To fetch WordPress content from remote server use the `bin/fetch` command with the corresponding mode `[live|staging]`and content flag.

Because this will overwrite local content, by default no content is fetched from the remote server without specifying a content flag.

To fetch remote WordPress theme content (considered core content with `-c` flag) from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -t
```

To fetch remote WordPress plugin content (considered core content with `-c` flag) from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -p
```

To fetch remote WordPress upload content (considered core content with `-c` flag) from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -u
```

To fetch all core remote WordPress content from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -c
```

To fetch remote WordPress must use plugin content from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -m
```

To fetch remote WordPress database dump file from the live site, open this projects root directory in terminal and run:

```bash
bin/fetch live -d
```

This utility has a simulate flag (`-s`) to simulate the command to be executed and output the exact command to your terminal window **without** running the command. This is ideal to verify the command and allows you to check for configuration issues before you run it.

To see all available options, run `bin/fetch` with the `--help` flag.

_This script assumes the local data path relative to the executing root directory, this is configured in the in `config/config.rb` file._

### Database Exporting

To create a WordPress database export use the `bin/export` command with the corresponding mode `[dev|live|staging]` of the WordPress database you which to export.

To export a database dump file of the local dev WordPress database for this project, open this projects root directory in terminal and run:

```bash
bin/export dev
```

To export a database dump file of the remote live WordPress database for this project, open this projects root directory in terminal and run:

```bash
bin/export live
```

To export a database dump file of the remote staging WordPress database for this project, open this projects root directory in terminal and run:

```bash
bin/export staging
```

This utility has a simulate flag (`-s`) to simulate the command to be executed and output the exact command to your terminal window **without** running the command. This is ideal to verify the command and allows you to check for configuration issues before you run it.

To see all available options, run `bin/export` with the `--help` flag.

_This script assumes the local data path relative to the executing root directory and the remote data path relative to the remote root directory, this is configured in the in `config/config.rb` file._

### Database Importing

**NOTE:** Before importing database content your Docker containers must be running. Depending on the size of your database, importing might take several minute to complete.

To import a WordPress database dump file use the `bin/import` command with the corresponding mode `[dev|live|staging]` of the WordPress database You wish to import **INTO**.

To import a database dump file into the local dev database for this project, open this projects root directory in terminal and run:

```bash
bin/import dev
```

By default only the database contents are imported, if you want to replace the website's live URL with a development URL specified in the `config/config.rb` while importing then you should run `bin/import dev` using the replace flag:

```bash
bin/import dev -r
```

To import a database dump file into the remote live database for this project, open this projects root directory in terminal and run:

```bash
bin/import live
```

By default only the database contents are imported, if you want to replace the website's development URL with a live URL specified in the `config/config.rb` while importing then you should run `bin/import live` using the replace flag:

```bash
bin/import live -r
```

This utility has a simulate flag (`-s`) to simulate the command to be executed and output the exact command to your terminal window **without** running the command. This is ideal to verify the command and allows you to check for configuration issues before you run it.

To see all available options, run `bin/import` with the `--help` flag.

_This script assumes the local data path relative to the executing root directory and an import file name, this is configured in the in `config/config.rb` file._

### Sass Styling

To modify source scss files for this project and output css files, open this projects root directory in terminal and run:

```bash
bin/sass
```

By default output is compressed, if you want to be able to read your css (for debugging) then you should run `bin/sass` using the expanded style flag:

```bash
bin/sass -e
```

To see all available options, run `bin/sass` with the `--help` flag.

_This script assumes the WordPress theme path relative to the executing root directory, this is configured in the in `config/config.rb` file._

## Deployment

**WARNING: This is a destructive action on the remote server. BEFORE MOVING FORWARD WITH DEPLOYMENT TO AN EXISTING REMOTE SERVER PLEASE REMEMBER TO BACKUP YOUR REMOTE SERVER CONTENT FIRST.**

Making a backup is easy, losing all your content over a small configuration issue is a disaster. Here's the command I use on my remote server over ssh, feel free to see if it works for you. Safety first!

```bash
tar -vczf ~/backup/archive-$(date +%F).tar ~/public_html
```

To deploy WordPress content to remote live server use the `bin/deploy live` command with the corresponding content flag. Because this will overwrite remote content, by default no content is deployed to the remote server without specifying a content flag.

To deploy WordPress theme content to the remote live server, open this projects root directory in terminal and run:

```bash
bin/deploy live -t
```

To deploy WordPress plugins to the remote live server, open this projects root directory in terminal and run:

```bash
bin/deploy live -p
```

To deploy WordPress must use plugins to the remote live server, open this projects root directory in terminal and run:

```bash
bin/deploy live -m
```

To deploy WordPress uploads to the remote live server, open this projects root directory in terminal and run:

```bash
bin/deploy live -u
```

This utility has a simulate flag (`-s`) to simulate the command to be executed and output the exact command to your terminal window **without** running the command. This is ideal to verify the command and allows you to check for configuration issues before you run it.

To see all available options, run `bin/deploy` with the `--help` flag.

_This script assumes the local content paths relative to the executing root directory and remote content paths relative to the remote root directory, this is configured in the in `config/config.rb` file._

## Contributing

Bug reports, pull requests, and enhancements are welcome on [GitHub](https://github.com/VictorSK/wp-workshop). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct. It's code, lets have fun!

## License

WP Workshop is copyright © 20021-2023 Victor S. Keenan. It is free software and may be redistributed under the terms specified in the [LICENSE](LICENSE) file.

## Coded With Love

Coded crafted by me, [Victor S. Keenan](https://www.victorkeenan.com). Find me on Twitter [@VictorSK](https://twitter.com/victorsk) or [hire me](https://www.inspyre.com) to design, develop, and grow your product or service.
