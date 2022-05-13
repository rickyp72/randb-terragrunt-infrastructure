PS1='$(PWD | rev | cut -d '/' -f 1 | rev)'

if  [ -d "$PS1" ]
then
echo venv exists.
echo "$PS1"
fi