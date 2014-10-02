#!/bin/bash
source /etc/init.d/functions.sh

# set fancy output
FANCYTTY=1
export FANCYTTY

# override LSB defaults
unset log_success_msg
unset log_warning_msg
unset log_failure_msg
unset log_begin_msg

log_success_msg()
{
  einfo $@
}

log_warning_msg()
{
  ewarn $@
}

log_failure_msg()
{
  eerror $@
}

log_begin_msg()
{
  ebegin $@
}

