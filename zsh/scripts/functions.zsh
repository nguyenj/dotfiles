# Simple server
# Start an HTTP server from a directory, optionally specifying the port
function server() {
  local port="${1:-8000}"
  open "http://localhost:${port}/"
  # Set the default Content-Type to `text/plain` instead of `application/octet-stream`
  # And serve everything as UTF-8 (although not technically correct, this doesn’t break anything for binary files)
  python -c $'import SimpleHTTPServer;\nmap = SimpleHTTPServer.SimpleHTTPRequestHandler.extensions_map;\nmap[""] = "text/plain";\nfor key, value in map.items():\n\tmap[key] = value + ";charset=UTF-8";\nSimpleHTTPServer.test();' "$port"
}

pe_docker() {
  # Poll Everywhere docker stuff
  pe_docker_running=$(docker-machine ls | grep polleverywhere)
  if [[ "$pe_docker_running" == *"Running"* ]]; then
    eval $(docker-machine env polleverywhere)

  else
    docker-machine start polleverywhere
    eval $(docker-machine env polleverywhere)
  fi
}
