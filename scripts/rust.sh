ICON="🦀 "

get_version() {
  count=`ls -1 *.{rs} 2>/dev/null | wc -l`
  if [[ -f Cargo.toml || $count -gt 0 ]]; then
    local version=$(rustc --version | cut -d' ' -f2)

    echo ${ICON}${version}
    return 1
  fi
}


get_version
