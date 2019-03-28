out_ps=NewZealand.ps
input_list=eq.list
 
cpt=NewZealand.cpt
 
gmt set PS_MEDIA A3
 
gmt makecpt -T0/315/15 -Crainbow -Z > $cpt
 
# start gmt session
gmt psxy -R0/1/0/1 -JX1c -T -K -P > $out_ps
 
# Main map
gmt psbasemap -R165/180/-48/-33 -Jm1 -B1 -G0/250/250 -X-0.5 -Y12 -O -K >> $out_ps
gmt pscoast -R -J -B -W1 -G250/250/0 -Df -Ia -O -K >> $out_ps
awk '{if ($3>=0 && $3<1) print $1, $2, $4}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($3>=1 && $3<2) print $1, $2, $4}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=2 && $3<3) print $1, $2, $4}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=3 && $3<4) print $1, $2, $4}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=4 && $3<5) print $1, $2, $4}' $input_list | gmt psxy -R -J -Sc0.4 -W0.01 -C$cpt -O -K >> $out_ps
echo 178 -30 22,1,black 0 CM New Zealand last 50 earthquakes 0328 | gmt pstext -R -J -F+f+a+j -N -O -K >> $out_ps
# Bottom map
gmt psbasemap -R165/180/0/300 -Jx1/-0.01 -Bxa1f1 -Bya100f20 -X0 -Y-7 -O -K >> $out_ps
awk '{if ($3>=0 && $3<1) print $1, $4, $4}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($3>=1 && $3<2) print $1, $4, $4}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=2 && $3<3) print $1, $4, $4}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=3 && $3<4) print $1, $4, $4}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=4 && $3<5) print $1, $4, $4}' $input_list | gmt psxy -R -J -Sc0.4 -W0.01 -C$cpt -O -K >> $out_ps

# Right map
gmt psbasemap -R0/300/-48/-33 -Jx0.01/1.3 -Bxa100f20 -Bya1f1 -X20 -Y7 -O -K >> $out_ps
awk '{if ($3>=0 && $3<1) print $4, $2, $4}' $input_list | gmt psxy -R -J -Sc0.05 -C$cpt -O -K >> $out_ps
awk '{if ($3>=1 && $3<2) print $4, $2, $4}' $input_list | gmt psxy -R -J -Sc0.1 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=2 && $3<3) print $4, $2, $4}' $input_list | gmt psxy -R -J -Sc0.2 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=3 && $3<4) print $4, $2, $4}' $input_list | gmt psxy -R -J -Sc0.3 -W0.01 -C$cpt -O -K >> $out_ps
awk '{if ($3>=4 && $3<5) print $4, $2, $4}' $input_list | gmt psxy -R -J -Sc0.4 -W0.01 -C$cpt -O -K >> $out_ps

gmt psscale -C$cpt -D-12.5/-10+w12/0.5+jTC+h -Bxaf+l"Depth" -By+lkm -O -K >> $out_ps
 
# end gmt session 
gmt psxy -R -J -O -T >> $out_ps 
 
# convert to pdf 
gmt psconvert $out_ps -P -Tf 
# convert to png 
gmt psconvert $out_ps -P -Tg