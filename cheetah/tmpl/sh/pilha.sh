#!/bin/bash

# $Id:$
# Federal University of Rio de Janeiro
# Author: Ivan carlos da Silva Lopes
# Mail: lopesivan (dot) ufrj (at) gmail (dot) com
# License: GPL
# Language: shell script
# File: stack_eval.sh


Pilha(){ obj_id=$1


       eval "$obj_id.set(){
               eval \"$obj_id.get(){
                       echo \$*
               }\"
       }"

       eval "$obj_id.add(){
                       $obj_id.set \$* \$($obj_id.get)
               }"
}

##############################################################################
# ---------------------------------- main ---------------------------------- #
##############################################################################

# declarando variavel.
Pilha  variable

variable.set Universidade Federal  # inicializando
variable.get                       # imprime

variable.add do                    # adicionando
variable.add Rio De Janeiro
variable.get                       # imprime

variable.set                       # limpando pilha.
variable.get                       # imprime

variable.set  um                   # limpando pilha.
variable.get                       # imprime

variable.add dois                  # adicionando
variable.add tres                  # adicionando
variable.add quatro                # adicionando
variable.add cinco                 # adicionando
variable.add seis                  # adicionando
variable.add sete                  # adicionando
variable.add oito                  # adicionando
variable.add nove                  # adicionando
variable.add dez                   # adicionando

variable.get                       # imprime

# AHHHHHHHHHHHHHHH... eh uma pilha ?!
# -mas eh claro seu ze mane.


# ----------------------------------------------------------------------------
exit 0
# vim: set ts=4 sw=4 tw=78 ft=sh:
