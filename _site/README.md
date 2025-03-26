for f in `ls`; do ts=`cat $f | grep "date: " | cut -d" " -f2`; mv $f "$ts-$f" ; done

