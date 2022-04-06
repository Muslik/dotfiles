ICON="⬢ "

get_version() {
  count=`ls -1 *.{js,jsx,ts,tsx} 2>/dev/null | wc -l`
  if [[ -f package.json || -d node_modules || $count -gt 0 ]]; then
    local version=$(node -v 2>/dev/null)

    echo ${ICON}${version}
    return 1
  fi
}

get_version
