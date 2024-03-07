venv () {
    echo activating venv $1
    source ~/.venv/$1/bin/activate
}

lint_airflow () {
    black . && isort . && flake8 .
}


mutagen-sync-src () {
  mutagen sync create ~/Desktop/src/$1 dev:~/src/$1
}

mutagen-kill-all () {
  mutagen sync terminate --all
}

mutagen-pause-all () {
  mutagen sync pause --all
}

mutagen-resume-all () {
  mutagen sync resume --all
}

