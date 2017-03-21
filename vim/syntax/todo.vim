" File:        todo.vim
" Description: Todo.txt syntax settings

if exists("b:current_syntax")
    finish
endif

syntax  match  TodoProject    '\(^\|\W\)+[^[:blank:]]\+'  contains=NONE
syntax  match  TodoContext    '\(^\|\W\)@[^[:blank:]]\+'  contains=NONE

highlight  default  link  TodoProject    Function
highlight  default  link  TodoContext    String

let b:current_syntax = "todo"
