Continuous Integration For The Win!
========================================================

The slides for my presentation at [PyOhio 2016][event].

[event]: http://pyohio.org/

Summary
-------

Learn how to increase the quality of your code and improve team productivity by leveraging a CI pipeline to run tests, lint, and measure code coverage. Then, integrate all that knowledge right into a GitHub pull request for easy team review & verification before deployment.

Abstract
--------

A great development workflow will make your good developers great, and your great developers exceptional. A bad workflow will take your best engineers productivity down to a junior level and make her wish she worked elsewhere.

It is critically important for every team and especially the leaders of those teams to get their development workflow in order. Automation is a cornerstone of a great development workflow. Every task that can be done by a machine should be. Continuous Integration (CI) is the practice of testing each change done to your codebase automatically and as early as possible.

We will review how to setup a CI environment for a Python project. Our overview will include:

* A brief overview of automated testing of a small Python app (using py.test)
* Running those tests with tox
* Using a Docker container to minimize OS differences in CI
* Setting up the project tests to run in CircleCI when code committed to GitHub
* Adding linting to the project & CI
* Adding code coverage to the project & CI
* Integrating this all with GitHub pull requests so the "build status" of a PR can be easily verified.

The first two paragraphs of this abstract mostly borrowed with permission from: https://css-tricks.com/continuous-integration-continuous-deployment/

Slide Viewer
------------

To view the slides, visit:
[Continuous Integration For The Win! (slides) by Randy Syring][slides]

[slides]: https://cdn.rawgit.com/rsyring/continuous-integration-ftw/master/_build/slides/index.html
