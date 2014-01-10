Contributing a patch
--------------------

The public stable branch for end users is `master`.

The branch for development is `develop`. You must write your patches and features on top of this branch.

Any pull request built on top of `master` instead of `develop` requires additionnal merge work for maintainers, which you want to avoid for quick integration of your work.

If you wrote your patch on the wrong branch, the maintainers may choose to close the pull request and ask you to rewrite it on top of the 'develop' branch.


HOW-TO: Git commands
--------------------

    $ git clone -b develop -o upstream git://github.com/stuarthannig/saas_starter-rails4.git
    $ cd saas_starter-rails4

    # Prepare a fix (include the issues number if applicable)
    $ git checkout -b fix/<my-fix>
    # Or prepare a new feature
    $ git checkout -b feature/<my-feature>

    # Hack, commit, hack, commit...

    # Fork the project on Github (if you haven't already)

    # Add the remote target for pushes
    $ git remote add origin git@github.com:<your github username>/saas_starter-rails4.git

    # Check that your local repo is up-to-date
    $ git fetch
    # Rebase your work on the lastest maintained 'develop' brnach
    $ git rebase upstream/develop

    # Push your commits
    $ git push github fix/<my-fix>

    # Create the pull request on Github. Make sure the 'develop' branch as the starting point for your branch.


How to make a good pull request?
--------------------------------

1. Check that your git settings for authorship are correct: `$ git config -l | grep ^user\.`
2. All the commits in the pull request must be on the same topic. If you propose fixes on different topics, use separate branches in your repo and make a pull request for each.
3. Good commit messages:
     - First line must be 72 chars max and is a summary of the commit.
     - Second line must be empty.
     - Following lines are optional but your are encouraged to express what the changes do. Use references to the Github issues number (ex: #432) if applicable.
4. Use a descriptive title for your pull request.
5. Put details, web links, in the pull request body. Use Markdown to format the content (see Github help on formatting).

How will my patch be applied?
-----------------------------

Before being applied, your pull request will be reviewed by the maintainers and other users. You can help the project by reviewing other pull requests as well.

If your patch is accepted, it will be applied either by:
- Merging your branch.
- Cherry-picking your commit on top of the `develop` branch. This makes the history linear, and easier to track.

In any case, your authorship will be preserved in the commit.
