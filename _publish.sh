#!/bin/bash
set -x
./_commit.sh $@ && ./_push.sh $@ && ./_sync_web.sh
