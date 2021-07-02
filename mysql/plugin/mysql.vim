fun! s:login()
python3 << EOF
import vim
import json
import os
import re
from mysql import mysql
sql = mysql()
name = vim.vars['sql_name']
database = vim.vars['sql_database']
sql.getcursor("chandler","dbooks")
EOF
endfun
