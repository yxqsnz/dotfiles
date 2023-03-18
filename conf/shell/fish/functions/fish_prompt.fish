set hy_pwd_color "\e[91m"
set gray "\e[90m"
set nor $hydro_color_normal

function fish_prompt --description Hydro
    echo -e "$gray""[$nor$USER$gray:$nor$hy_pwd_color$_hydro_pwd$gray]$_hydro_color_git$$_hydro_git$hydro_color_normal$_hydro_color_duration$_hydro_cmd_duration$hydro_color_normal$gray$_hydro_status$hydro_color_normal "
end
