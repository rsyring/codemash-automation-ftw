#!/bin/bash
PYTHONWARNINGS=ignore::UserWarning watchmedo shell-command \
    --command='vex slides make -e slides' \
    . _static _templates
