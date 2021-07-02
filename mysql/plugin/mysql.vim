fun! s:login()
python3 << EOF
import vim
import json
import os
import re
from mysql import mysql
"" getinfo login info
name = vim.vars['sql_name']
database = vim.vars['sql_database']
sql = mysql()
sql.getcursor(name,database)
EOF
endfun
"click table name split window and show the info of create table info 
"use operator function to parse the the sql snippets 
