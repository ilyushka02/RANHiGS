@echo off

pip install -r ./requirements.txt
cls
python ./my_script.py %*

pause