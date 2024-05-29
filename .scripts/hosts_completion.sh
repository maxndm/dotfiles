_hosts_completions()
{
    local cur opts
    cur="${COMP_WORDS[COMP_CWORD]}"
    opts=$(awk '/^[^#]/ {print $2}' /etc/hosts)

    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
    return 0
}
