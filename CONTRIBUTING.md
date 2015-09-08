Working With the LBW Web Site
=============================


Requirements
------------

You need a POSIX environment, i.e. some variety of Linux/Unix, OS X or Cygwin
with a Bash-like shell.

1. Install [Git] [1] via your distribution's package manager.

2. Install Perl and the Perl [Template Toolkit] [2] library via your package
   manager or CPAN.


Initial Repository Setup
------------------------

You need to do these steps once before making any changes to the site.

1. Clone the Git repository:

        git clone https://linuxbierwanderung.com/lbwsite.git

   This will create a directory 'lbwsite' in the current directory. This is
   is your working copy of the repository. Note that this not only contains
   the latest version of the repo but is a separate repository in its own right
   with the whole change history and all branches (see below) existing at the
   time of the checkout.

   The repository you created the clone from is a so-called "remote" and named
   "origin" by convention. It is the default target when you upload your
   changes with `git push` and when you retrieve changes by others with `git
   pull` (or `fetch`). You can list the defined remote repositories with:

        git remote -v

2. Change into the `lbwsite` directory.

3. Create a new branch for your changes::

        git checkout -n <new-branch-name>

  Use something like "feature/newdesign" or "bugfix/headerlayout" as the branch
  name. This step is optional but highly recommended, since it makes it much
  easier to submit or create a patch of your changes later and to synchronize
  to the master repository while keeping your changes separate while working on
  them. Creating a branch also automatically "activates" it, so when you commit
  any changes, they are commited to this branch.

  You can list the existing branches with::

        git branch -v

  The default branch which should exist in every (new) repository is called
  "master".

  You can change between branches with:

        git checkout <branch-name>

  Yes, I know, it's silly that the command is also called checkout. That's Git
  for you.


Building the Site
-----------------

Open a shell, change into the `lbwsite` directory and run:

    ./build.sh

This does a few things:

1. It creates the output directory `out` beneath the current directory (and
   deletes) an existing one.
2. Copies the background images to it.
3. Builds the site from the template files in `src` via the `ttree` command,
   using the file `ttreerc` as the configuration.
4. Creates a new empty git repository in `out/lbwsite.git`.
5. Mirrors your repository in `lbwsite` into `out/lbwsite.git`.
6. Does some Git repository adminstrative stuff.

You can view the generated site by opening `out/index.html` in your browser.


Making Changes
--------------

Open a shell, change into the `lbwsite` directory and make sure your repository
has the latest changes from the "origin" remote repository:

    git pull

This will fetch changes from the "origin" and update your working copy with
them (i.e. merge them with your changes). `git pull` is shorthand for `git
fetch` followed by `git merge FETCH_HEAD`.

Then make your changes to the source files under the `src` directory.

### Updating Your Branch

(Ignore this section if you do not use your own branch.)

Note that `git pull` only works on the currently active branch. If you have
created and activated a new branch to work on your changes, you need to change
to (activate) the "master" branch to merge the remote changes into your local
"master" branch:

    git checkout master
    git pull

If this pulls any changes and you want to include them into your branch,
activate your branch and merge the new changes from the "master" branch into
it:

    git checkout <my-branch>
    git merge master


### Commiting Changes

You can check which files have changed or which are new with:

    git status

Note that the file `.gitignore` defines patterns for files and directories
whose changes are ignored. The output directory `out` is listed in there, so
the generated site files to not show up with `git status`.

To see *what* has changed:

    git diff

This will give you a unified diff of changes that have not been *added* (see
below) yet.

If you are happy with a change, you need to *commit* it. This registers a
*changeset* in *your local* repository. To distribute the change to others,
you'll either need to *push* these changes to another (remote) repository (if
you're allowed to) or prepare a path and send to someone, e.g. via email.

Before you can commit changes to a file (or several) you need to *add* the
file(s) to the *staging area*, i.e. the collection of changes which will be
commited with the next `commit` command. You can either specify the file(s) to
add, e.g.:

    git add README.md

or add all changed files, even newly created ones, which hadn't been under
version control yet, with:

    git add -A

You have to repeat the `add` command after each new change, which you want to
go into the next commit. Check with `git status` regularly for any un-added
changes, esp. before issuing the `commit` command. To see a diff of the changes
that go into the next commit:

    git diff --cached

Before you commit, rebuild the site and check that everything works as
intended.

Finally, commit your changes, giving a meaningful (!) log message:

    git commit -m "Fixed URL in README file"

This will commit all added changes.

Repeat the edit, `git add`, `git commit` cycle for each change that constitutes
a defined, separate change (how much goes into each commit is a philosophical
discussion not touched here).


Distributing Your Changes
-------------------------

How this is done depends on whether you have write access to the "origin" (see
above) remote repository or not.

If you don't, you can pack up a series of commits into a bundle, suited for
sending via email with:

    git bundle create my-branch.bundle master..<my-branch>

This will make a bundle with all changes/commits that separate your branch from
the "master" branch. Send the `my-branch.bundle` file to the owner of the
"origin" repository and (s)he'll hopyfully know what to do with it and merge
your changes. ;)

*This section to be continued...*


[1]: https://git-scm.com/
[2]: http://www.template-toolkit.org/
