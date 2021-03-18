# Contribute Instructions

[Back](./)

## 🔱 First, Fork This Repo by clicking here [![GitHub](https://img.shields.io/github/forks/ChrisBarnes2000/myCity.svg?style=flat-square)](https://github.com/ChrisBarens2000/myCity/fork).

## 📋 Second, Clone your version for local dovelopment

```zsh
$ git clone https://github.com/YourUserName/myCity.git
```

## 📝 Third, Create a new branch starting with your username

```zsh
$ git checkout -b ChrisBarnes2000
or
$ gco -b ChrisBarnes2000
```

## ⚙️ Fourth, Configure Your Local Environment

1. Create a virtual environment to isolate and container-ize our development server.

```zsh
$ virtualenv env && source venv/bin/ativate
$ pip install --upgrade pip && pip install -r requirements.txt
```

### 🖋️ Remember to Document your Changes.

## 🛠️ Fifth, Make Modificaitons on your new branch ⚒️

Run Locally, by Building the image to run the container on docker

- Build the image:

   `docker build -t flask-image .`

- Build the container:

   `docker run -p 5000:5000 --rm --name flask-container flask-image`

Test it out at [http://localhost:5000](http://localhost:5000).

### 🛑 Stop The Local Server ❌

```zsh
$ command+C or ⌘C
```

### 🧰 Command Short Cuts used below

| Description             | Short Cut | Regular             |
| ----------------------- | --------- | ------------------- |
| Add all changes         | ga .      | git add .           |
| checkout branch         | gco       | git checkout        |
| checkout master branch  | gcm       | git checkout master |
| merge changes to master | gm        | git merge Branch    |
| push to origin          | gp        | git push            |

## 💻 Local Branch Development

1. Create/Switch to branch and work on it there..

    ```zsh
    $ gco <Branch-Name>
    ```

2. Edit Stuff and Test locally

3. add, commit, & Push to that branch

    Use tags when committing ```ga .;gcmsg "[function] description"```

    - [Add]: File or Function XYZ
    - [Fix]: Typo or Function or explaination, etc
    - [Pull]: From Whom or What Branch For What Reason
    - [Refactor]: File or Function XYZ For Reason LMNOP
    - [Remove]: File or Function XYZ For Reason LMNOP
    - [Update]: File or Function XYZ For Reason LMNOP

    ```zsh
    $ git push origin <Branch-Name>
    ```

4. Switch to master

    ```zsh
    $ gcm
    or 
    $ git checkout master
    ```

5. Merge with master

    ```sh
    $ gm <Branch-Name>
    or
    $ git merge <Branch-Name>
    ```

6. Push

    ```sh
    $ gp
    or
    $ git push
    ```

🔁🔁 Repeat 🔁🔁 branching and update your team and progress tracker / [Rubric-Scoring](Rubric-Scoring.md) 🔁🔁
