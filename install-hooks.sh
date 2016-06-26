#!/bin/sh

cp hooks/post-checkout .git/hooks/
chmod +x .git/hooks/post-checkout

cp hooks/post-merge .git/hooks
chmod +x .git/hooks/post-merge
