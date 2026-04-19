#!/usr/bin/env bash
# SessionStart hook for spec-skills plugin
set -euo pipefail

# Determine plugin root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" && pwd)"
PLUGIN_ROOT="$(cd "${SCRIPT_DIR}/.." && pwd)"

# Build skills list from all SKILL.md files
skills_list=""
for skill_dir in "${PLUGIN_ROOT}"/skills/*/; do
  skill_file="${skill_dir}SKILL.md"
  if [ -f "$skill_file" ]; then
    skill_name=$(basename "$skill_dir")
    # Extract description from frontmatter
    skill_desc=$(grep "^description:" "$skill_file" | head -1 | sed 's/^description: *//')
    if [ -n "$skills_list" ]; then
      skills_list="${skills_list}\n"
    fi
    skills_list="${skills_list}- **${skill_name}**: ${skill_desc}"
  fi
done

# Escape for JSON
escape_for_json() {
  local input="$1"
  local output=""
  local i char
  for (( i=0; i<${#input}; i++ )); do
    char="${input:$i:1}"
    case "$char" in
      $'\\') output+='\\' ;;
      '"') output+='\"' ;;
      $'\n') output+='\n' ;;
      $'\r') output+='\r' ;;
      $'\t') output+='\t' ;;
      *) output+="$char" ;;
    esac
  done
  printf '%s' "$output"
}

skills_escaped=$(escape_for_json "$skills_list")

cat <<EOF
{
  "systemContext": "You have the following custom skills available. Use the Skill tool to invoke them when relevant:\n\n${skills_escaped}\n\nIf you think there is even a 1% chance a skill might apply to your task, invoke it before responding."
}
EOF
exit 0
