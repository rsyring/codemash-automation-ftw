#!/bin/bash
PYTHONWARNINGS=ignore::UserWarning watchmedo shell-command \
    --command='make -e slides' \
    . _static _templates
