# DOT for jetbrains IDE graphs and plantuml
export GRAPHVIZ_DOT="$(brew --prefix graphviz)/bin/dot"

# FUTU
export HOST_NETWORK_ENVIRONMENT=DEV
export CMLB_PROXY_URL=http://172.24.21.29:7777
export MONITOR_PROXY_URL=http://172.24.21.29:8899
export FTRACE_UDP_AGENT_HOST=172.24.31.35:5831
export CONSUL_AGENT_ADDRESS=10.10.160.226:8500
export FMONITOR_AGENT_HOST=10.1.147.25:8092

export GOPROXY=https://goproxy.io,direct

export GPG_TTY=$(tty)

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
