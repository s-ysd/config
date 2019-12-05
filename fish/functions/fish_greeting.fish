function fish_greeting -d "What's up, fish?"
    #set_color $fish_color_autosuggestion
    set_color cyan
    #uname -nmsr
    echo \n
    echo "When one door closes, another opens;"
    echo "but we often look so long and so regretfully upon the closed door that we do not see the one which has opened for us."
    echo "--Alexander Graham Bell--"

    # TODO: `command -q -s` only works on fish 2.5+, so hold off on that for now
    #command -s uptime >/dev/null
    #and command uptime

    set_color normal
end
