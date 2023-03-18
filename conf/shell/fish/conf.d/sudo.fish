set SUDO_PROMPT (printf " \e[34m Password: \e[39m")


alias sudo="sudo -p \"$SUDO_PROMPT\""
