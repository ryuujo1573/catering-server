#!/bin/bash

# Select first available python
python_ls=(python3.11 python3.10 python3.9 python3.8 python3 python)

for default in ${python_ls[*]}; do
   # echo "testing '$default'..."
   if type "$default" &>/dev/null; then
      break
   fi
done

CR=(↵ ↩)
CR=${CR[1]}

echo -e "Please specify which python to use." \
      "\e[1;30m$CR $default\e[m "
if type "gum" &>/dev/null; then
   py_exec=$(gum input --cursor.foreground "#FF0" --prompt.foreground "#0FF" --prompt "> " --placeholder "$default" --width 80)
else
   echo -ne '\e[1;30m'
   read -ei $default py_exec
   echo -ne '\e[m'
fi

py_exec=${py_exec:-$default}
echo -ne '\e[36m'
$py_exec -V
echo -ne '\e[m'

# Create venv
$py_exec -m venv .venv
[ $? == 0 ] && source ./.venv/bin/activate
[ $? == 0 ] && pip install -r requirements.txt
