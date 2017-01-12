.. default-role:: code

===========================================
Continuous Integration for the Win!
===========================================

| By: Randy Syring
| Twitter: @RandySyring
| Email: randy.syring@level12.io
| https://github.com/rsyring/

.. epigraph::
    Impassioned. Software. Craftsmanship.

.. image:: _static/level12-logo.png

Introduction
==============

.. image:: _static/level12-logo.png
    :align: right

I'm the Chief Executive Developer at `Level 12 <https://www.level12.io/>`_.

Level 12 is software development firm
specializing in web and data(base) projects tailor made for our customers.

Agile methodologies make our customers happy...really, really, happy.

Why should you care?


My "real world", YMMV
============================

- Methods & concepts refined over last 7 years
- Primarily involved with web & data(base) development (11 years)
- Not operating *"at scale"*
- These are "Best Practices" and I'm a slow adopter
- Your context may differ


This Presentation
=================

* Encouragement
* Technical summary of layers involved
* Questions


Example Project For Details
===========================

https://github.com/rsyring/pypicalc2

My Goal?
===============

.. image:: _static/meme.jpg
   :class: fullpic


My Real Goal
===============

To sustainably:

* Respond to change with minimal friction
* Frequently deliver high quality software

(velocity & quality)


Delivering on that Goal
=======================

Requires **automated testing** and processes, there is no other way.


Diminishing Returns
=======================

.. image:: _static/roi-graph.png
   :class: fullpic


Code Ratio
=======================

.. image:: _static/code-ratio.png
   :class: fullpic


Our Process
=======================

* Development on Git branch (prefer small changes)
* PR for merge
* Review code
* Validate tests
* Validate code coverage
* 1-click deploy (TODO)

Hard to *sustain* manually.


Unproductive
=======================

.. image:: _static/pisa.jpg
   :class: fullpic


Productive
=======================

.. image:: _static/gh-pr-snapshot.png
   :class: fullpic


More than a Process
===================

It's about culture.


Learning Curve Paralysis
========================

Technology fatigue is real, but this is worth it.


Eat the Elephant
========================

Getting CI to run correctly is often frustrating.  Rabbit holes galore.

Focus on constant incremental improvements, building layer by layer.


Speaking of Layers
========================

- *Tests/Linting/Coverage in a Virtual Env*
- Dependencies
- Tox
- Docker
- CI (with Circle CI)
- Code Coverage
- Service Integration (Slack, GitHub, Email)

In Virtualenv
=======================

.. code-block:: console

  (pypicalc2)$ py.test pypicalc/
  ......................................
  38 passed in 0.12 seconds
  (pypicalc2)$ flake8 pypicalc/
  (pypicalc2)$


With Code Coverage
=======================

.. code-block:: console

  (pypicalc2)$ py.test --cov pypicalc --cov-config .coveragerc pypicalc/
  ......................................
  ---------------------------------- coverage: platform linux, python 3.5.2-final-0 -----------------------------------
  Name                                      Stmts   Miss Branch BrPart  Cover
  ---------------------------------------------------------------------------
  pypicalc/app.py                              11      0      0      0   100%
  pypicalc/cli.py                               8      0      0      0   100%

  ...<snip>...

  pypicalc/tests/test_web_request_3.py         27      6      4      0    68%
  pypicalc/tests/test_web_request_4.py         18      1      4      1    91%
  pypicalc/version.py                           1      0      0      0   100%
  pypicalc/views.py                            13      0      2      0   100%
  ---------------------------------------------------------------------------
  TOTAL                                       628    102    115     19    78%
  38 passed in 0.24 seconds


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- *Dependencies*
- Tox
- Docker
- CI (with Circle CI)
- Code Coverage
- Service Integration (Slack, GitHub, Email)


Dependencies
=======================

.. code-block:: console

  $ tree requirements/
  requirements/
  ├── deployed-env.txt
  ├── dev-env.txt
  ├── includes
  │   ├── build-only.txt
  │   ├── ci.txt
  │   ├── common.txt
  │   ├── dev.txt
  │   └── install-only.txt
  ├── wheelhouse
  │   ├── appdirs-1.4.0-py2.py3-none-any.whl
  │   ├── arrow-0.7.0-py3-none-any.whl
  │   ├── ...<snip>...
  └── wheelhouse-build.txt


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- Dependencies
- *Tox*
- Docker
- CI (with Circle CI)
- Code Coverage
- Service Integration (Slack, GitHub, Email)

Tox Summary
========================

* Creates virtualenvs
* Installs dependencies from wheelhouse
* Runs the tests w/ coverage
* Runs the linter
* Fails with a non-zero exit code if applicable

Tox
========================

.. code-block:: console

  $ tox
  py35 runtests: commands[0] | pip install -r requirements/deployed-env.txt
  Ignoring indexes: https://pypi.python.org/simple
  Collecting Keg (from -r requirements/includes/install-only.txt (line 1))
  ...<snip>...
  Installing collected packages: MarkupSafe, Jinja2, Werkzeug, itsdangerous, Flask, appdirs, blinker, pathlib, Click, wrapt, six, BlazeUtils, SQLAlchemy,
  ...<snip>...
  py35 runtests: commands[1] | py.test -c .ci/pytest.ini -ra --tb native --strict --cov pypicalc --cov-config .coveragerc --cov-report xml --no-cov-on-fail --junit-xml=/home/rsyring/projects/pypicalc2-src/.ci/test-reports/py35.pytests.xml pypicalc
  ================================================ test session starts ================================================
  platform linux -- Python 3.5.2, pytest-2.9.1, py-1.4.31, pluggy-0.3.1
  rootdir: /home/rsyring/projects/pypicalc2-src, inifile: .ci/pytest.ini
  plugins: cov-2.2.1
  collected 38 items

  pypicalc/tests/test_cli.py .
  ...<snip>...
  pypicalc/tests/test_web_request_4.py .

  ------------ generated xml file: /home/rsyring/projects/pypicalc2-src/.ci/test-reports/py35.pytests.xml -------------
  ---------------------------------- coverage: platform linux, python 3.5.2-final-0 -----------------------------------
  Coverage XML written to file coverage.xml
  ============================================= 38 passed in 0.30 seconds =============================================

  flake8 recreate: /home/rsyring/projects/pypicalc2-src/.tox/flake8
  flake8 installdeps: flake8
  flake8 runtests: commands[0] | flake8 pypicalc
  ______________________________________________________ summary ______________________________________________________
    py35: commands succeeded
    flake8: commands succeeded
    congratulations :)


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- Dependencies
- Tox
- *Docker*
- CI (with Circle CI)
- Code Coverage
- Service Integration (Slack, GitHub, Email)

Docker
=======

The heart of the `docker-run-tests` script:

.. code-block:: bash

  docker run \
      -v $SRC_DPATH:/opt/src \
      -v $ARTIFACTS_DPATH:/opt/src/.ci/artifacts \
      -v $TEST_REPORTS_DPATH:/opt/src/.ci/test-reports \
      $DOCKER_FLAGS \
      level12/python-test-multi


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- Dependencies
- Tox
- Docker
- *CI (with Circle CI)*
- Code Coverage
- Service Integration (Slack, GitHub, Email)


CI is So Simple!! ;)
========================

.. code-block:: yaml

  machine:
    services:
      - docker

  test:
    override:
      - /home/ubuntu/$CIRCLE_PROJECT_REPONAME/docker-run-tests


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- Dependencies
- Tox
- Docker
- CI (with Circle CI)
- *Code Coverage*
- Service Integration (Slack, GitHub, Email)

Code Coverage w/ CodeCov
=========================
::

      py.test \
        ...<snip>...
        --cov pypicalc \
        --cov-config .coveragerc \
        --cov-report xml \
        --no-cov-on-fail \
        --junit-xml={toxinidir}/.ci/test-reports/{envname}.pytests.xml \
        pypicalc

.. code-block:: console

  $ ls .ci/test-reports/
  py35.pytests.xml

.. code-block:: yaml

  deployment:
    codecov:
      branch: /.*/
      commands:
        - bash <(curl -s https://codecov.io/bash) -t <token>

Code Coverage Result
=========================

.. image:: _static/codecov-snapshot.png
   :class: fullpic

`And More <https://codecov.io/github/rsyring/pypicalc2?branch=master>`_


Speaking of Layers
========================

- Tests/Linting/Coverage in a Virtual Env
- Dependencies
- Tox
- Docker
- CI (with Circle CI)
- Code Coverage
- Service Integration (Slack, GitHub, Email)


Service Integration: Slack
==========================

.. image:: _static/slack-screenshot.png
   :class: fullpic


Service Integration: GitHub
===========================

.. image:: _static/gh-pr-integration.png
   :class: fullpic


Questions?
======================

Thanks for attending.

| By: Randy Syring
| Twitter: @RandySyring
| Email: randy.syring@level12.io
| https://github.com/rsyring/

Image credits:

* http://reqtest.com/testing-blog/you-cant-work-agile-without-automated-testing/
* http://www.slideshare.net/lfingerman/test-automation-best-prcatices-with-soa-test-approach
