GIT_ICON="  "

get_git_branch() {
  if ($(git rev-parse --is-inside-work-tree &> /dev/null)); then
    echo "${GIT_ICON}$(git rev-parse --abbrev-ref HEAD)"
  fi
  return 1
}

get_git_branch
