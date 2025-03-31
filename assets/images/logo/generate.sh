for f in `ls *.svg | sed s/\.svg//g`; do 
	for s in 16 32 48 64 96 100 150 200 250 300 350 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 2250 2500 2750 3000 3500 4000 5000; do 
		rsvg-convert -f svg -w $s $f.svg > generated/$f-$s.svg;
		rsvg-convert -f png -w $s $f.svg > generated/$f-$s.png;
	done
done
