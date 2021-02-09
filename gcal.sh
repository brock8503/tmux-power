#!/bin/bash
if (( $(date '+%s') - $(cat ~/.tmux/.status_lastrun || echo 0) >= 600 )); then
  echo "$(date '+%s')" > ~/.tmux/.status_lastrun;
  echo $(gcalcli agenda --nocolor --nostarted --military | head -2 | tail -1 | perl -pe 's/\e([^\[\]]|\[.*?[a-zA-Z]|\].*?\a)//g' | xargs echo -n | tee ~/.tmux/.status_cache);
else
  cat ~/.tmux/.status_cache;
fi
