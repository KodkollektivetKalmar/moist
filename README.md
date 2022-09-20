# Moist 💦

This is a project for KodKollektivet members to create their own steam like client for hosting their own video games.

- [Moist 💦](#moist-)
  - [Join in! ❤️](#join-in-️)
    - [Contributing to the project: How To](#contributing-to-the-project-how-to)
    - [Branching Guidelines](#branching-guidelines)
    - [Code Review Guidelines](#code-review-guidelines)
    - [Git Workflow Summary](#git-workflow-summary)
  - [Client 🕹️](#client-️)
    - [Development language](#development-language)
    - [Login page](#login-page)
    - [Games list page](#games-list-page)
    - [Game page](#game-page)
    - [Friends](#friends)
  - [Server 💾](#server-)
    - [Users](#users)
    - [Games](#games)
    - [High scores](#high-scores)

## Join in! ❤️

The project will be developed by any member who wants to join in. If you're interested in participating, contact @krukle, or someone else in the board of KodKollektivet Kalmar.

Some quick ideas are in the `design` directory. As you'll quickly realise, I'm no UI designer. If you're one, please do join in and help us with the design of the application!

### Contributing to the project: How To

In order to begin new work on your project, you will need to clone the repository.

Steps:

_If you have never worked on the repository before:_

- Clone the repository to your local machine and navigate to the
  created project folder; you will find yourself on the default branch (main/master).

_If you already have a copy of this repository on your local machine_

- From the main/master branch of your local copy of the repository, make sure to do a `git pull` to
  make sure you are working on the latest copy of code from the origin (this will include any
  changes merged to the main branch since you last cloned/pulled the repo).

_Then:_

- Create a new branch for your changes
- Make your code changes on the branch you created
- When complete, commit your changes
- Push the branch to origin
- Create a pull request from your branch to the main branch.

An example sequence of git commands used in this process is provided in the
[Git Workflow Summary](#git-workflow-summary).

### Branching Guidelines

No commits should be made directly to the default branch (usually main/master/develop). Instead,
branches should be created off the default branch to encompass any changes.

Branches must have descriptive names.

For an example, let's take create a branch for the games list filter function and call it _games-list-filter_.

This would be created and checked out by using the git command:

```bash
git checkout -b games-list-filter
```

### Code Review Guidelines

You are strongly encouraged to get your code reviewed by a friend or someone else in the proejct as soon as there is any code to
review, to get a second opinion on the chosen solution and implementation, and an extra pair of eyes
looking for bugs, logic problems, or uncovered edge cases.

### Git Workflow Summary

#### Start a new piece of work

1. Synch repo and set up for your new feature branch:

   ```shell
   git checkout main
   git pull main
   git checkout -b games-list-filter
   ```

2. Make changes, commit and push to origin:

   ```shell
   git add .
   git commit
   git push -u origin games-list-filter
   ```

3. Remember to submit a pull request via GitHub when ready to merge your changes to main.

#### Continue a piece of work

1. If the branch has already been created in the remote repository.

   ```shell
   git checkout games-list-filter
   ```

2. Pull in any new code from the default branch

   ```shell
   git pull origin main
   ```

3. Resolve any merge conflicts that may now be revealed.

4. Continue to Step 2 in [Start a new piece of work](#start-a-new-piece-of-work) flow.

#### Collaborate on an existing branch

Ideally, we should avoid having developers working on the same code. It creates merge conflicts and
hinders efficiency. If possible, try to break it down into small tasks so developers can work
independently. In the worst-case scenario, if there is more than 1 person working on a feature
branch:

1. Please make sure you pull changes in the remote branch before starting your work.

   ```shell
   git pull origin games-list-filter
   ```

2. Resolve any merge conflicts that may now be revealed.
3. Continue to Step 2 in [Start a new piece of work](#start-a-new-piece-of-work) flow.

## Client 🕹️

### Development language

As of now our plan is to program the client side in flutter. Knowing flutter is not a prerequisite for joining in on the project. I have never touhed flutter, nor have anyone else in the board of KodKollektivet Kalmar.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

### Login page

### Games list page

### Game page

### Friends

#### Friend list

#### Chat

#### Trades

#### Game invites

## Server 💾

To be able to host games we'll need a server side to the application. We also want people to be able to authenticate and sign in. For this I'm thinking databases through sqlite3, and something easier to host the server on like a Raspberry Pi.

### Users

Users credentials will have to be saved for users to be able to sign in. This requires good security for proper password management.

### Games

Installation files for games have to be hosted by us for moist users to be able to download the games.

### High scores

We want every game to have its own score board where KodKollektivet members can duke it out for the highest poition on the boards.

For this we'll have to develop some kind of API for game developers to post their high scores to our server.
