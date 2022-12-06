#!/bin/bash
# for Linux


#tcp status
metric=$1
tmp_file=`/bin/netstat -an|awk '/^tcp/{++S[$NF]}END{for(a in S) print a,S[a]}'`

case $metric in
   closed)
          output=`echo ${tmp_file#*CLOSED} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   listen)
          output=`echo ${tmp_file#*LISTEN} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synrecv)
          output=`echo ${tmp_file#*SYN_RECV} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   synsent)
          output=`echo ${tmp_file#*SYN_SENT} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   established)
         output=`echo ${tmp_file#*ESTABLISHED} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   timewait)
          output=`echo ${tmp_file#*TIME_WAIT} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closing)
          output=`echo ${tmp_file#*CLOSING} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   closewait)
          output=`echo ${tmp_file#*CLOSE_WAIT} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
        ;;
   lastack)
          output=`echo ${tmp_file#*LAST_ACK} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait1)
          output=`echo ${tmp_file#*FIN_WAIT1} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
   finwait2)
          output=`echo ${tmp_file#*FIN_WAIT2} | awk -F ' ' '{print $1}'`
          if [ "$output" == "" ];then
             echo 0
          else
             echo $output
          fi
         ;;
         *)
          echo -e "\e[033mUsage: sh  $0 [closed|closing|closewait|synrecv|synsent|finwait1|finwait2|listen|established|lastack|timewait]\e[0m"
esac
