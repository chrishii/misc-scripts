#!/bin/bash

ps aux --sort -rss | head -n 11 | awk {'print $6/1024 " MB -", $11'} | tail -n +2

