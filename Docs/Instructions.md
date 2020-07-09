# Contribute Instructions
[Back](./)

## To Get Started

- Learn the [Difference Between Clone and Fork](https://www.toolsqa.com/git/difference-between-git-clone-and-git-fork/)
- Then follow these instructions to [Fork and Clone](https://help.github.com/en/github/getting-started-with-github/fork-a-repo) this repo

<!-- ## Next Set up the environment

Look for these files to change

<!-- ![image](static/img/docs/look-for-me.jpeg) ->
if the .env files below don't exist then run
```Bash
$ touch filename
```

1. Rename `*.env.dev-sample*` to `*.env.development*`.
2. Update the environment variables (ask team lead for new values) in the `*docker-compose.yml*` and `*.env.development* files`.
3. Add a folder titled `mediafiles` to the `apps` directory
4. Build the images and run the containers: -->


# Development

### Run Locally
```sh
$ docker-compose up --build
```

Test it out at [http://localhost:8000](http://localhost:8000). The "app" folder is mounted into the container and your code changes apply automatically.

### Stop The Local Server
```sh
$ docker-compose down
```

Command Short Cuts used below
| Description               | Short Cut |       Regular       |
| ------------------------- | --------- | ------------------- |
| Add all changes           |  ga .     | git add .           |
| checkout branch           |  gco      | git checkout        |
| checkout master branch    |  gcm      | git checkout master |
| merge changes to master   |  gm       | git merge Branch    |
| push to origin            |  gp       | git push            |


# Branching

1. Create/Switch to branch and work on it there.. 
    ```sh
    $ gco FrontEnd
    ```

2. Edit Stuff and Test locally

3. Merge with master and fix any conflicts
    ```sh
    $ gm FrontEnd/Development/Fixes
    ```

4. add, commit, & Push to that branch

    Use tags when committing ```ga .;gcmsg "[function] description"```
    * [pull]    Who made last change and your addition
    * [update]  description or file being modified
    * [add]     description or file being modified
    * [remove]  description or file being modified
    * [fix]     description or file being modified
    ```sh
    $ git push origin FrontEnd/Development/Fixes
    ```

5. Switch to master
    ```sh
    $ gcm
    ```
6. Merge with master
    ```sh
    $ gm FrontEnd/Development/Fixes
    ```
7. Push
    ```sh
    $ gp
    ```

Repeat branching and update your team and progress tracker


<!-- # Production

Uses gunicorn + nginx.

1. Rename `*.env.prod-sample*` to `*.env.production*` and `*.env.prod.db-sample*` to `*.env.prod.db*`. Update the environment variables (again ask team lead).
2. Build the images and run the containers:

    ```sh
    $ docker-compose -f docker-compose.prod.yml up --build
    ```

    Test it out at [http://localhost:1337](http://localhost:1337). No mounted folders. To apply changes, the image must be re-built.

### Stop The Server
```sh
$ docker-compose down
``` -->

## Other Docker [Commands](Docs/Docker-comands.md)
