# Use gpg-agent as the SSH agent (holds imported SSH keys + GPG auth).
# Needed on hosts where fish is symlink-managed and home-manager's
# programs.fish init (which would otherwise set this) does not apply.
if status is-interactive
    set -gx GPG_TTY (tty)
    gpgconf --launch gpg-agent
    set -gx SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
end
