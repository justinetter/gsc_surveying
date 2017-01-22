#!/bin/sh

ssh root@159.203.130.33 'service unicorn stop && cd /home/rails/simplr && git pull && service unicorn start'
