venv () {
    echo activating venv $1
    source ~/.venv/$1/bin/activate
}

lint_airflow () {
    black . && isort . && flake8 .
}

